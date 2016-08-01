class Mobile::TagAPI < ApplicationAPI
  # include Entities::Expose

  resources :tags do
    desc "Return all tags"
    get "/" do
      present :status, :success
      present :data, Tag.all, with: Entities::TagExpose
    end
  end
end
