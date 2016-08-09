class Mobile::TagAPI < ApplicationAPI
  include Defaults::Mobile

  resources :tags do
    desc "Return all tags"
    get "/" do
      begin
        present :status, :success
        present :data, Tag.all, with: Entities::TagExpose
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end
  end
end
