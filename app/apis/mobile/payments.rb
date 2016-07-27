module Mobile
  class Payments < Grape::API
    include Mobile::Defaults

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
        requires :event_id, type: Integer, desc: "event id"
        requires :omise_token, type: String, desc: "omise token"
      end
      post '/credit-card' do
        if params[:user_token].present? and params[:event_id].present? and params[:omise_token].present?
          begin
            charge = Omise::Charge.retrieve(params[:omise_token])

            raise unless User.find_by_token(params[:user_token]).present?

            Payment.omise(params[:user_token], params[:event], charge)

            present :status, :success
            present :data, ''
          rescue
            present :status, :error
            present :data, ''
          end
        else
          present :status, :error
          present :data, ''
        end
      end

      desc 'pay by bank transfer'
      params do
        requires :user_token, type: String, desc: "token of the user"
        requires :event_id, type: Integer, desc: "event id"
        requires :amount, type: Integer
        requires :evidence, type: File
      end
      post '/bank-transfer' do
        if params[:user_token].present? and params[:event_id].present? # and params[:evidence].present?
          begin
            raise unless User.find_by_token(params[:user_token]).present?

            Payment.transfer(params[:user_token], params[:event], params[:evidence], params[:amount])

            present :status, :success
            present :data, ''
          rescue
            present :status, :error
            present :data, ''
          end
        else
          present :status, :error
          present :data, ''
        end
      end

    end
  end
end
