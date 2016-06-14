class API < Grape::API
  version 'v1', using: :header, vendor: 'daydash'
  format :json
  prefix 'api'

  mount Daydash::Event
  mount Daydash::User
end
