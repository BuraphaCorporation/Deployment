
module V1
  class Base < Grape::API
    version 'v1', using: :header, vendor: 'daydash', format: :json, cascade: true

    mount V1::User
    mount V1::Event
    mount V1::Organizer
  end
end
