class ApplicationAPI < Grape::API

  mount V1::AuthAPI
  mount V1::TagAPI
  mount V1::UserAPI
  mount V1::EventAPI
  mount V1::PaymentAPI

  helpers do
    def permitted_params
      @permitted_params ||= declared(params, include_missing: false)
    end

    def logger
      Rails.logger
    end

    # https://mikecoutermarsh.com/rails-grape-api-key-authentication/
    def authenticate!
      error!('Unauthorized. Invalid or expired token.', 401) unless current_user
    end

    def current_user
      token = ApiKey.where(access_token: params[:token]).first
      if token && !token.expired?
        @current_user = User.find(token.user_id)
      else
        false
      end
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    error_response(message: e.message, status: 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    error_response(message: e.message, status: 422)
  end

  add_swagger_documentation mount_path: '/v1',
    base_path: '/',
    api_version: '1.0.0',
    info: {
    contact: 'hello@thekanko.co',
    terms_of_service_url: 'https://thekanko.co/terms',
    title: 'TheKanko API'
    },
    markdown: false,
    hide_documentation_path: true,
    hide_format: true,
    include_base_url: true,
    models: ::Entities.constants.select { | c | Class === ::Entities.const_get(c) }
                            .map { | c | "::Entities::#{c.to_s}".constantize }

end
