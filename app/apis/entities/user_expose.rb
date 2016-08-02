class Entities::UserExpose < Grape::Entity
  expose :email
  expose :first_name
  expose :last_name
  expose :gender
  expose :birthday
  expose :phone
  # expose :avatar do |a|
  #   a.avatar(:medium)
  # end
  expose :referal_code
end

class Entities::UserTicketExpose < Grape::Entity
  expose :tickets do |ticket|
    if ticket.exists?
      true
    else
      false
    end
  end
end
