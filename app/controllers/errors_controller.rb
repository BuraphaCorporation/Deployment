class ErrorsController < ApplicationController
  before_action :global_categories

  layout 'daydash'

  def not_found
    if request.host.eql?("www.daydash.co")
      redirect_to App.domain, :status => 301
    else
      render(:status => 404)
    end
  end

  def internal_server_error
    render(:status => 500)
  end
end
