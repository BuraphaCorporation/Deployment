class Client::CoreController < ApplicationController
  include DaydashHelper
  layout "daydash"

  before_action :global_categories

  def global_categories
  	@g_categories = Category.all
  end
end
