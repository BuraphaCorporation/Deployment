class ErrorsController < ApplicationController
  before_action :global_categories

  layout 'thekanko'

  def not_found
    if request.host.eql?("www.thekanko.co")
      redirect_to App.domain, :status => 301
    else
      render(:status => 404)
    end
  end

  def internal_server_error
    render(:status => 500)
  end
end
