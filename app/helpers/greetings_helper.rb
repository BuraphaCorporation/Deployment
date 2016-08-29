module GreetingsHelper

  def mobile_device?
    !request.user_agent.downcase.match(/iphone|android/).nil?
  end
end
