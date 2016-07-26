
class Client::CoreController < ApplicationController
  include DaydashHelper
  before_action :management!

  layout "daydash"

  private
    def management!
      $management = false
    end
end
