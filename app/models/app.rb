
class App < Struct.new(:region, :environment, :version)

  def initialize(attrs = {})
    defaults              = YAML.load_file('config/instance.yml') rescue nil
    attrs                 = (defaults || {}).with_indifferent_access.merge(attrs)
    attrs[:region]      ||= 'th'
    attrs[:environment] ||= ['production', 'provisioning'].include?(ENV['RAILS_ROOT']) ? 'staging' : ENV['RAILS_ROOT'] || 'development'
    attrs[:version]     ||= 'master'
    attrs.each_pair { |k, v| self[k] = v.inquiry }
  end

  def API
    case environment
    when 'production'
      "https://api.daydash.co"
    when 'staging'
      "https://brick-api.daydash.co"
    else
      "http://dev-api.daydash.co:1337"
    end
  end

  # config.paperclib_defaults = {
  #   storage: :s3,
  #   s3_credentials: {
  #     bucket: ENV.fetch('S3_BUCKET_NAME'),
  #     access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
  #     secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
  #     s3_region: ENV.fetch('AWS_REGION'),
  #   }
  # }

  def is_management?
    $management
  end

  def configure
    config = OpenStruct.new

    case environment
    when 'production', 'staging'
      config.facebook_app_id      = '286214348393614'
      config.facebook_app_secret  = 'fe56812591fad8625997a9ceecc133bf'
    when 'production'
      config.firebase             = 'https://daydash.firebaseio.com/'
      config.redis                = { host: 'redis.daydash.co', port: 6379, timeout: 25 }
    when 'staging'
      config.firebase             = 'https://daydash-staging.firebaseio.com/'
      config.redis                = { host: 'redis-staging.daydash.co', port: 6379, timeout: 25 }
    else
      config.firebase             = 'https://daydash-development.firebaseio.com/'
      config.redis                = { host: '127.0.0.1', port: 6379, timeout: 25 }
      config.facebook_app_id      = '259929777688738'
      config.facebook_app_secret  = 'bdaef0f0beb25366bef19febf2366312'
    end

    config
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
