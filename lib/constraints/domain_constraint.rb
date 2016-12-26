class DomainConstraint

  def initialize(domain)
    @domain = [domain].flatten
  end

  def matches?(request)
    @domain.include? request.domain
  end
end
