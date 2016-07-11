
module API
  class Base < Grape::API
    mount API::Mobile::Base
  end
end
