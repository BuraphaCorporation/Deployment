FactoryGirl.define do
  factory :api_key do
    access_token "MyString"
    expires_at "2016-10-21 09:15:40"
    user_id 1
    active false
  end
end
