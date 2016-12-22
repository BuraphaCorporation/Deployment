module Client
  class PaymentsController < Client::BaseController
    before_action :related_events, only: :checkout
    before_action :event
    before_action :seo_events, except: :checkout

    def selection
      total = 0
      session[:event]    = @event.id
      session[:tickets]  = {}
      session[:sections] = []

      sections = []
      @event.sections.each do |section|
        sections << params[:section]["#{section.id}"].to_i
        if params[:section]["#{section.id}"].to_i > 0
          raise "you need to hack more limit tickets" if params[:section]["#{section.id}"].to_i > section.show_ticket_available
          total += section.sale_price * params[:section]["#{section.id}"].to_i
          session[:tickets].merge!({
            "#{section.id}": {
              title: section.title,
              price: section.sale_price,
              quantity: params[:section]["#{section.id}"].to_i,
            }
          })
          session[:sections] << { "id": section.id, "price": section.sale_price.to_i * 100, "qty": params[:section]["#{section.id}"].to_i }
        end
      end

      raise unless sections.any?{ |x| x > 0 }

      session[:tickets][:total] = total.to_i * 100

      redirect_to client_payment_express_path(@event.to_url)
    rescue Exception => e
      session[:event]    = nil
      session[:tickets]  = nil
      session[:sections] = nil
      redirect_back
    end

    def express
      set_seo_title @event.try(:title)

      redirect_to root_url unless @event.id == session[:event]
      @tickets = session[:tickets]
      @is_free = true if @tickets["total"].to_i == 0
    end

    def checkout
      set_seo_title 'Checkout'

      raise if session["tickets"]["total"].nil?

      dob = Date.strptime("#{params[:dob_date]}/#{params[:dob_month]}/#{params[:dob_year]}", "%d/%m/%Y")

      current_user.update(
        first_name: params[:firstname],
        last_name:  params[:lastname],
        phone:      params[:phone],
        birthday:   dob,
        gender:     params[:gender],
      )

      @order = Order.create(user: current_user, event: @event, price: session["tickets"]["total"])
      case params[:payment_method]
      when 'credit_card'
        @payment = Payment.omise_token_charge(@order, params[:omise_token])

        if @payment[:status] == :error
          raise @payment[:message]
        else
          @order.approve!
        end
      when 'bank_transfer'
        @payment = Payment.transfer_notify(@order)
      when 'free'
        raise "error" if @event.sections.min_by(&:price).price > 0
        @payment = Payment.free(@order)
        @order.approve!
      end

      sections = []
      session[:sections].each{|s| sections << Hashie::Mash.new(s)}

      if @payment[:status] != :error
        sections.each do |section|
          (1..section.qty).each do |i|
            Ticket.create_ticket(current_user, @order, @event, section)
          end
          Section.cut_in(section.id, section.qty, @event)
        end
      else
        raise @payment[:message]
      end

      @order.send_notify!
      render :checkout
    rescue Exception => e
      flash[:credit_card_error] = 'ข้อมูลบัตรไม่ถูกต้องค่ะ กรุณาตรวจสอบอีกครั้งค่ะ'
      redirect_back
    end

  private
    def related_events
      @related_events = Event.where.not(slug: params[:id]).list.first(3)
    end

    def event
      @event = Event.friendly.find(params[:payment_id].downcase)
    end

    def seo_events
      set_seo_title @event.try(:title)
    end
  end
end