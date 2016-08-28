class GreetingsController < ApplicationController
  layout false

  def rating
    redirect_to case request.user_agent.downcase
    when /iphone/
      App.domain
    when /android/
      App.domain
    else
      App.domain
    end
  end

  def blog
    slug = params[:slug]
    redirect_to "#{App.blog}/#{slug}", status: :moved_permanently
  end

  def faq
  end

  def terms
  end

  def policy
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
