class ApplicationAPI < Grape::API
  # Follow: http://dreamingechoes.github.io/api/ruby/rails/create-a-super-fancy-api-with-grape/
  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  helpers do
    def api_response response
      case response
      when Integer
        status response
      when String
        response
      when Hash
        response
      when Net::HTTPResponse
        "#{response.code}: #{response.message}"
      else
        status 400 # Bad request
      end
    end

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

    def clean_params(params)
      ActionController::Parameters.new(params)
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

  mount V1::AuthAPI
  mount V1::TagAPI
  mount V1::UserAPI
  mount V1::EventAPI
  mount V1::PaymentAPI

  add_swagger_documentation \
    api_version: '1.0.0',
    hide_documentation_path: true,
    hide_format: true,
    markdown: false,
    info: {
      contact: 'wadealike@gmail.com',
      terms_of_service_url: 'https://wadealike.com/terms',
      title: 'WadeAlike API'
    },
    include_base_url: true,
    mount_path: '/v1',
    base_path: '/',
    security_definitions: {
      api_key: {
        type: "apiKey",
        name: "api_key",
        in: "header"
      }
    }
    # models: ::Entities.constants.select { | c | Class === ::Entities.const_get(c) }
    #                         .map { | c | "::Entities::#{c.to_s}".constantize }
end

#   class Product < Grape::API
#     # use Rack::JSONP
#     helpers do
#       params :token do
#         optional :token, type: String, default: nil
#       end
#       params :attributes do
#         optional :attributes, type: Hash, default: {}
#       end
#     end
#     resource :products do
#       get do
#         api_response(::Product.all.to_json)
#       end
#     end
#     route_param :id do
#       params do
#         use :token, type: String, desc: 'Authentication token'
#         requires :id, type: Integer, desc: "Product ID"
#       end
#       get do
#         begin
#           authenticate!
#           product = ::Product.find(params[:id])
#           api_response(product.to_json)
#         rescue ActiveRecord::RecordNotFound => e
#           status 404 # Not found
#         end
#       end
#     end
#     params do
#       use :token
#       requires :attributes, type: Hash, desc: 'Product object to create' do
#         requires :name, type: String, desc: 'Name of product'
#         requires :description, type: String, desc: 'Description of product'
#         requires :image_url, type: String, desc: 'URL of image for product'
#         requires :price, type: Integer, desc: 'Price of product'
#         requires :stock, type: Integer, desc: 'Stock of product'
#       end
#     end
#     post do
#       begin
#         authenticate!
#         safe_params = clean_params(params[:attributes])
#                       .permit(:name, :description, :image_url, :price, :stock)
#         if safe_params
#           ::Product.create!(safe_params)
#           status 200 # Saved OK
#         end
#       rescue ActiveRecord::RecordNotFound => e
#         status 404 # Not found
#       end
#     end
#     params do
#       use :token, type: String, desc: 'Authentication token'
#       requires :id, type: Integer, desc: "Product ID"
#       requires :attributes, type: Hash, desc: 'Product object to create' do
#         requires :name, type: String, desc: 'Name of product'
#         requires :description, type: String, desc: 'Description of product'
#         requires :image_url, type: String, desc: 'URL of image for product'
#         requires :price, type: Integer, desc: 'Price of product'
#         requires :stock, type: Integer, desc: 'Stock of product'
#       end
#     end
#     put ':id' do
#       begin
#         authenticate!
#         safe_params = clean_params(params[:attributes]).permit(:name, :description, :image_url, :price, :stock)
#         if safe_params
#           product = ::Product.find(params[:id])
#           product.update_attributes(safe_params)
#           status 200 # Saved OK
#         end
#       rescue ActiveRecord::RecordNotFound => e
#         status 404 # Not found
#       end
#     end
#   end
