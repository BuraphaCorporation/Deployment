module Entities
  class ErrorExpose < Grape::Entity
    expose :code
    expose :message
  end
end
