class Client::EventsController < Client::CoreController
  before_action :event_payment, only: [:selection, :express, :checkout]
  before_action :related_events, only: [:show, :checkout]


  def index
    @covers = [
      { image: '/src/images/content/cover-1.jpg', caption: '<h1 class="title">เพราะเราเชื่อว่า ชีวิตไม่ได้มีด้านเดียว</h1><div class="subtitle">ค้นพบกิจกรรมและอีเว้นท์เจ๋งๆ พร้อมสัมผัสประสบการณ์ใหม่ๆ ได้ที่นี่</div>' },
      { image: '/src/images/content/cover-2.jpg', caption: '<h1 class="title">เพราะเราเชื่อว่า ชีวิตไม่ได้มีด้านเดียว</h1><div class="subtitle">ค้นพบกิจกรรมและอีเว้นท์เจ๋งๆ พร้อมสัมผัสประสบการณ์ใหม่ๆ ได้ที่นี่</div>' },
    ]

    @categories = Category.all

    @events = if params[:category].present? and @categories.pluck(:name).include?(params[:category])
      @categories.friendly.find(params[:category]).events
    else
      Event.all
    end
  end

  def show
    @event    = Event.friendly.find(params[:id])
    @section  = @event.first_section
  end

  def selection
    total = 0
    session[:event]    = @event.id
    session[:tickets]  = {}
    session[:sections] = []

    @event.sections.each do |section|
      if params[:section]["#{section.id}"].to_i > 0
        total += section.price
        session[:tickets].merge!({
          "#{section.id}": {
            title: section.title,
            price: section.price,
            quantity: params[:section]["#{section.id}"].to_i,
          }
        })
        session[:tickets][:total] = total.to_i * 100
        session[:sections] << { "id": section.id, "price": section.price.to_i * 100, "qty": params[:section]["#{section.id}"].to_i }
      end
    end

    redirect_to client_event_express_path(@event.to_url)
  end

  def express
    redirect_to root_url unless @event.id == session[:event]
    @tickets = session[:tickets]
  end

  def checkout
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

      @order.approve! unless @payment[:status] == :error

      render_by_payment_mothod = "client/events/payment-credit-card"
    when 'bank_transfer'
      @payment = Payment.transfer_notify(@order)

      render_by_payment_mothod = "client/events/payment-bank-transfer"
    end

    sections = []
    session[:sections].each{|s| sections << Hashie::Mash.new(s)}

    if @payment[:status] != :error
      sections.each do |section|
        (1..section.qty).each do |i|
          Ticket.create_ticket(current_user, @order, @event, section)
        end
        Section.cut_in(section.id, section.qty)
      end
    else
      @payment[:message]
    end

    render render_by_payment_mothod
  end

private
  def related_events
    @related_events = Event.list.first(3)
  end

  def event_payment
    @event = Event.friendly.find(params[:event_id])
  end
end
