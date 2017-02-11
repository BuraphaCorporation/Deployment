class V1::PaymentAPI < ApplicationAPI
  include Defaults::V1

  resources :payment do
    desc "return channel payment"
    get '/' do
      present :status, :success
      present :data, [
        {
          method: 'credit-card'
        },
        {
          method: 'bank-transfer'
        }
      ]
    end

    desc "return "
    params do
      requires :payment_code, type: String, desc: 'payment code'
    end
    get '/check' do
      begin
        payment = Order.where(code: params[:payment_code])
        present :status, :success
        present :data, payment
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end

    desc 'pay by credit card'
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :omise_token, type: String, desc: "omise token"
      requires :event_id, type: Integer, desc: 'event id'
      requires :sections, type: Array[JSON], desc: 'group section id example: [{"id":1, "qty":2}, {"id":2, "qty":2}]'
      requires :total_price, type: Integer, desc: "Section price"
    end
    post '/credit-card' do
      begin
        if params[:user_token].present? and params[:event_id].present? and params[:sections].present? and params[:omise_token].present? and params[:total_price].present?
          @user = User.find_by_access_token(params[:user_token])
          @event = Event.find(params[:event_id])

          @order = Order.create(user: @user, event: @event, price: params[:total_price].to_i * 100)
          @payment = Payment.omise_customer_charge(@order, params[:omise_token])

          if @payment[:status] == :error
            raise @payment[:message]
          else
            @order.approve!
          end

          sections = @params[:sections]

          if @payment[:status] != :error
            sections.each do |section|
              (1..section.qty).each do |i|
                Ticket.create_ticket(@user, @order, @event, section)
              end
              Section.cut_in(section.id, section.qty, @event)
            end
          else
            raise @payment[:message]
          end

          if @order.tickets.present?
            if @order.omise? || @order.free?
              Workers::UserTicketWorker.perform_async(@order.id)
            else
              Workers::UserOrderWorker.perform_async(@order.id)
            end
            Workers::OrganizerOrderWorker.perform_async(@order.id)
          end

          present :status, :success
          present :data, @order, with: Entities::PaymentOmiseExpose
        else
          present :status, :failure
          present :data, nil
        end
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end

    desc 'pay by bank transfer'
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :event_id, type: Integer, desc: "event id"
      requires :event_id, type: Integer, desc: 'event id'
      requires :sections, type: Array[JSON], desc: 'group section id example: [{"id":1, "qty":2}, {"id":2, "qty":2}]'
      requires :total_price, type: Integer, desc: "Section price"
    end
    post '/bank-transfer' do
      begin
        if params[:user_token].present? and params[:event_id].present? and params[:sections].present? and params[:total_price].present?
          @user = User.find_by_access_token(params[:user_token])
          @event = Event.find(params[:event_id])

          @order = Order.create(user: @user, event: @event, price: params[:total_price].to_i * 100)
          @payment = Payment.transfer_notify(@order)

          sections = @params[:sections]

          if @payment[:status] != :error
            sections.each do |section|
              (1..section.qty).each do |i|
                Ticket.create_ticket(@user, @order, @event, section)
              end
              Section.cut_in(section.id, section.qty, @event)
            end
          else
            raise @payment[:message]
          end

          if @order.tickets.present?
            if @order.omise? || @order.free?
              Workers::UserTicketWorker.perform_async(@order.id)
            else
              Workers::UserOrderWorker.perform_async(@order.id)
            end
            Workers::OrganizerOrderWorker.perform_async(@order.id)
          end

          present :status, :success
          present :data, @order, with: Entities::PaymentTransferExpose
        else
          present :status, :failure
          present :data, 'params invalid'
        end
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end
  end
end
