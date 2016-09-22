class Client::CoreController < ApplicationController
  before_action :global_categories

  include DaydashHelper
  layout "daydash"
end
