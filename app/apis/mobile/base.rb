
module Mobile
  class Base < Grape::API
    mount Mobile::Authentication
    mount Mobile::Tags
    mount Mobile::Users
    mount Mobile::Events
    mount Mobile::Payments

    add_swagger_documentation(
      api_version: "mobile",
      base_path: "/",
      mount_path: "/mobile",
      hide_format: true,
      hide_documentation_path: true
    )
  end
end
