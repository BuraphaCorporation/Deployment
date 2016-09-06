class Entities::UserExpose < Grape::Entity
  expose :email
  expose :first_name
  expose :last_name
  expose :gender
  expose :birthday
  expose :phone
  expose :avatar do |item|
    item.picture(:medium)
  end
  expose :onesignal_id
  expose :omise_customer_id, as: :customer_token
  expose :referal_code
  expose :has_password do |item|
    if item.provider?
      item.sign_in_count > 1
    else
      true
    end
  end
end
