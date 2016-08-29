module GreetingsHelper

  def mobile_device?
    !request.user_agent.downcase.match(/iphone|ipad|android/).nil?
  end
end
