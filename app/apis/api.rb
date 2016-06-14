class API < Grape::API
  before do
    header["Access-Control-Allow-Origin"]   = "*"
    header["Access-Control-Request-Method"] = "*"
  end

  prefix 'api'
  format :json

  mount V1::Base

  add_swagger_documentation mount_path: '/api-docs',
                            api_version: '1.0.0',
                            info: {
                              contact: 'arnon@hongklay.com',
                              desctioption: 'bar bar bar',
                              terms_of_service_url: 'https://daydash.co/terms-of-service',
                              title: 'Daydash API'
                            },
                            markdown: false,
                            hide_documentation_path: true,
                            hide_format: true,
                            include_base_url: true,
                            models ::Entities.constants.select { |c| Class == ::Entities.const_get(c) }
                                                       .map { |c| "::Entities::#{c.to_s}".constantize }
end
