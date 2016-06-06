# require 'yaml'
# require 'active_support/core_ext/string/inquiry'
# require 'active_support/core_ext/hash/indifferent_access'

# Public: allows app instance-specific config to be retrieved.
# Most methods can be called on App and it will delegate to App.current.
class App < Struct.new(:region, :environment, :version)
  def initialize(attrs = {})
    defaults              = YAML.load_file('config/instance.yml') rescue nil
    attrs                 = (defaults || {}).with_indifferent_access.merge(attrs)
    attrs[:region]      ||= 'th'
    attrs[:environment] ||= ['production', 'provisioning'].include?(ENV['RAILS_ROOT']) ? 'staging' : ENV['RAILS_ROOT'] || 'development'
    attrs[:version]     ||= 'master'
    attrs.each_pair { |k, v| self[k] = v.inquiry }
  end

  def firebase
    base_uri = 'https://daydash.firebaseio.com/'

    Firebase::Client.new(base_uri)
  end

  class << self
    attr_accessor :current

    def method_missing(meth, *args, &block)
      current.send(meth, *args, &block)
    end
  end

  self.current = new
end
