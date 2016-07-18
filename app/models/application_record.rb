class ApplicationRecord < ActiveRecord::Base
  # if Rails.env.production?
  #   abstract_class = true
  # else
  self.abstract_class = true
  # end
end
