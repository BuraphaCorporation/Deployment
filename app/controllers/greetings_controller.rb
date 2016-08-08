class GreetingsController < ApplicationController

  def hello
  end

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
end
