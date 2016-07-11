
module API
  module Mobile
    class Base < Grape::API
      mount API::Mobile::Users

      add_swagger_documentation(
        api_version: "mobile",
        hide_documentation_path: true,
        mount_path: "/api/mobile/documentation",
        hide_format: true
      )
    end
  end
end
