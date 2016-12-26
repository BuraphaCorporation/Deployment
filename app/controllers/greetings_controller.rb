class GreetingsController < ApplicationController
  before_action :global_categories
  include GreetingsHelper
  layout :resolve_layout

  def index
    if params[:category].present?
      @category_id = Category.friendly.find(params[:category]).id
    else
      @category_id = nil
    end
    @events = Event.list
  end

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

  def about
  end

  def contact
  end

  def faq
  end

  def terms
  end

  def policy
  end

  def landing
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
    when 'index'
      'daydash'
    when 'about', 'faq', 'terms', 'policy', 'contact'
      if mobile_device?
        'greetings'
      else
        'daydash'
      end
    when 'landing'
      'landing'
    when 'campaign', 'campaign_terms'
      'landing'
    else
      false
    end
  end
end
