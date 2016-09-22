class MobileAPI < ApplicationAPI

  mount Mobile::AuthAPI
  mount Mobile::TagAPI
  mount Mobile::UserAPI
  mount Mobile::EventAPI
  mount Mobile::PaymentAPI
  # Docs
  add_swagger_documentation mount_path: "/mobile",
                            base_path: "/",
                            api_version: "1.0.0",
                            info: {
                             contact: "hello@daydash.co",
                            #  description: %Q(This is a sample server Petstore server.  You can find out more about Swagger \n    at <a href="http://swagger.wordnik.com">http://swagger.wordnik.com</a> or on irc.freenode.net, #swagger.  For this sample,\n    you can use the api key "special-key" to test the authorization filters),
                            #  license: "Apache 2.0",
                            #  license_url: "http://www.apache.org/licenses/LICENSE-2.0.html",
                             terms_of_service_url: "https://daydash.co/terms",
                             title: "Daydash API"
                            },
                            markdown: false,
                            hide_documentation_path: true,
                            hide_format: true,
                            include_base_url: true,
                            models: ::Entities.constants.select { | c | Class === ::Entities.const_get(c) }
                                                        .map { | c | "::Entities::#{c.to_s}".constantize }

end
