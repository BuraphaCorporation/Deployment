module TheKankoHelper

  def mobile_device?
    !request.user_agent.downcase.match(/iphone|android/).nil?
  end

  def current_site
    @set_page ||= "client"
  end
end
