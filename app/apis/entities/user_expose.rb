class Entities::UserExpose < Grape::Entity
  expose :email
  expose :first_name
  expose :last_name
  expose :gender
  expose :birthday
  expose :phone
  expose :avatar do |a|
    a.avatar(:medium)
  end
  expose :onesignal_id
  expose :customer_token
  expose :referal_code
end
