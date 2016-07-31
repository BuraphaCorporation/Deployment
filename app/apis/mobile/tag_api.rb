class Mobile::TagAPI < ApplicationAPI
  include Defaults::Mobile

  # include Entities::Expose

  resources :tags do
    desc "Return all tags"
    get "/" do
      present :status, :success
      present :data, Tag.all, with: Entities::Expose::Tag
    end
  end
end
