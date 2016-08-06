class Mobile::PaymentAPI < ApplicationAPI
  include Defaults::Mobile

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

    desc 'pay by credit card'
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :omise_token, type: String, desc: "omise token"
      requires :event_id, type: Integer, desc: 'event id'
      requires :sections, type: Array[JSON], desc: 'group section id example: [{"id":1, "qty":2}, {"id":2, "qty":2}]'
      requires :total_price, type: Integer, desc: "Section price"
    end
    post '/credit-card' do

      if params[:user_token].present? and params[:sections].present? and params[:omise_token].present? and params[:total_price].present?
        begin
          user = User.find_by_token(params[:user_token])
          event = Event.find(params[:event_id])

          payment = Payment.omise_charge(user, event, params[:sections], params[:total_price], params[:omise_token])

          present :status, :success
          present :data, payment, with: Entities::PaymentOmiseExpose
        rescue
          present :status, :failure
          present :data, nil
        end
      else
        present :status, :failure
        present :data, nil
      end
    end

    desc 'pay by bank transfer'
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :event_id, type: Integer, desc: "event id"
      # requires :amount, type: Integer
      # requires :evidence, type: File
      requires :total_price, type: Integer, desc: "Section price"

    end
    post '/bank-transfer' do
      if params[:user_token].present? and params[:event_id].present? # and params[:evidence].present?
        begin
          user = User.find_by_token(params[:user_token])
          event = Event.find(params[:event_id])

          payment = Payment.transfer_notify(user, event, params[:total_price])

          present :status, :success
          present :data, payment, with: Entities::PaymentTransferExpose
        rescue
          present :status, :failure
          present :data, 'raise'
        end
      else
        present :status, :failure
        present :data, 'params invalid'
      end
    end

  end
end
