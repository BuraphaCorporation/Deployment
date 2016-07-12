
module API
  module Mobile
    class Base < Grape::API
      mount API::Mobile::Authentication
      mount API::Mobile::Users
      mount API::Mobile::Events

      add_swagger_documentation(
        api_version: "mobile",
        base_path: "/api",
        mount_path: "/mobile",
        hide_format: true,
        hide_documentation_path: true
      )
    end
  end
end
