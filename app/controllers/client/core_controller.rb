class Client::CoreController < ApplicationController
  before_action :global_categories

  include DaydashHelper
  layout "daydash"

protected
  def global_categories
    @global_categories = Category.all
  end
end
