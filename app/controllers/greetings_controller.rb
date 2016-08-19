class GreetingsController < ApplicationController
  layout false

  def faq
  end

  def terms
  end

  def policy
  end

  def rating
    redirect_to case request.user_agent.downcase
    when /iphone/
      "http://daydash.co"
    when /android/
      "http://daydash.co"
    else
      "http://daydash.co"
    end.html_safe
  end

  def campaign
    @selected_campaign = ''
    if params[:campaign] == 'olive'
      @selected_campaign = 'olive'
    elsif params[:campaign] == 'lazgam'
      @selected_campaign = 'lazgam'
    elsif params[:campaign] == 'rock-domain'
      @selected_campaign = 'rock-domain'
    end
  end

  def campaign_terms
  end
end
