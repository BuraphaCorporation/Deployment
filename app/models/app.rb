
class App < Struct.new(:region, :environment, :version)
  def xxx
    'xxxx'
  end

  def initialize(attrs = {})
    defaults              = YAML.load_file('config/instance.yml') rescue nil
    attrs                 = (defaults || {}).with_indifferent_access.merge(attrs)
    attrs[:region]      ||= 'th'
    attrs[:environment] ||= ['production', 'provisioning'].include?(ENV['RAILS_ROOT']) ? 'staging' : ENV['RAILS_ROOT'] || 'development'
    attrs[:version]     ||= 'master'
    attrs.each_pair { |k, v| self[k] = v.inquiry }
  end

  def configure
    config = OpenStruct.new

    case environment
    when 'production'
      config.firebase = 'https://daydash.firebaseio.com/'
      config.redis    = { host: 'redis.daydash.co', port: 6379, timeout: 25 }
    when 'staging'
      config.firebase = 'https://daydash-staging.firebaseio.com/'
      config.redis    = { host: 'redis-staging.daydash.co', port: 6379, timeout: 25 }
    else
      config.firebase = 'https://daydash-development.firebaseio.com/'
      config.redis    = { host: '127.0.0.1', port: 6379, timeout: 25 }
    end

    return config
  end

  def firebase
    Firebase::Client.new(configure.firebase)
  end

  def redis
    Redis.new(configure.redis)
  end

  # def root
  #   protocol + '//' + host
  # end

  # def protocol
  #   region.th? && environment.production? ? 'https:' : 'http:'
  # end

  def no_reply
    'no-reply@daydash.co'
  end


  class << self
    attr_accessor :current

    def method_missing(meth, *args, &block)
      current.send(meth, *args, &block)
    end
  end

  self.current = new
end
