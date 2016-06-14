
module V1
  class User < Grape::API
    desc "Updated user", {
      nickname: 'update user',
      http_codes: {
        400: 'Invalid username supplied',
        404: 'User not found'
      }
    }

    params do
      requires :username, type: String, desc: 'name that need to be delete'
      requires :body, type: Entities::User
    end

    put '/user/:username' do
    end

    desc 'Delete user', {
      nickname: 'delete user'
    }
  end
end
