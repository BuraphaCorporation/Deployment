class GreetingsController < ApplicationController
  include GreetingsHelper

  layout :resolve_layout

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

private
  def resolve_layout
    case action_name
    when 'faq', 'terms', 'policy'
      if mobile_device?
        'greetings'
      else
        'daydash'
      end
    when 'campaign', 'campaign_terms'
      'campaign'
    else
      false
    end
  end
end
