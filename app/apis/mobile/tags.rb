module Mobile
  class Tags < Grape::API
    include Mobile::Defaults
    # include Entities::Expose

    resources :tags do
      desc "Return all tags"
      get "/" do
        present :status, :success
        present :data, Tag.all, with: Entities::Expose::Tag
      end
    end
  end
end
