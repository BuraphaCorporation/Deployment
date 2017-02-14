class App < Struct.new(:region, :environment, :version)

  def initialize(attrs = {})
    defaults              = YAML.load_file('config/instance.yml') rescue nil
    attrs                 = (defaults || {}).with_indifferent_access.merge(attrs)
    attrs[:region]      ||= 'th'
    attrs[:environment] ||= ['production', 'provisioning'].include?(ENV['RAILS_ROOT']) ? 'staging' : ENV['RAILS_ROOT'] || 'development'
    attrs[:version]     ||= 'master'
    attrs.each_pair { |k, v| self[k] = v.inquiry }
  end

  def domain(subdomain = nil)
    domain = case subdomain
    when 'api'
      "#{host('api')}.#{root_domain}"
    when 'admin'
      "admin.#{root_domain}"
    else
      root_domain
    end

    protocol + '//' + domain
  end

  def root_domain
    if environment.development?
      'wadealike.local'
    else
      'wadealike.com'
    end + port
  end

  def protocol
    environment.development? ? 'http:' : 'https:'
  end

  def port
    ':1337' if environment.development?
  end

  def host(subdomain = nil)
    case environment
    when 'staging', 'alpha'
      subdomain.nil? ? 'alpha' : "alpha-#{subdomain}"
    else
      "#{subdomain}"
    end
  end

  def configure
    config = OpenStruct.new

    case environment
    when 'production'
      config.firebase             = 'https://wadealike.firebaseio.com/'
      config.redis                = { host: 'redis.wadealike.com', port: 6379, timeout: 25 }
      config.facebook_app_id      = '259929777688738'
      config.facebook_app_secret  = 'bdaef0f0beb25366bef19febf2366312'
      config.ga_tracking_code     = 'UA-82041608-1'
      config.hotjar_id            = 281788
      config.slack_webhook           = "https://hooks.slack.com/services/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"
    when 'staging', 'alpha', 'alpha'
      config.firebase             = 'https://wadealike-staging.firebaseio.com/'
      config.redis                = { host: 'redis-staging.wadealike.com', port: 6379, timeout: 25 }
      config.facebook_app_id      = '259929777688738'
      config.facebook_app_secret  = 'bdaef0f0beb25366bef19febf2366312'
      config.ga_tracking_code     = 'UA-82041608-2'
      config.hotjar_id            = 281789
      config.slack_webhook        = "https://hooks.slack.com/services/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x"
    else
      config.firebase             = 'https://wadealike-development.firebaseio.com/'
      config.redis                = { host: '127.0.0.1', port: 6379, timeout: 25 }
      config.facebook_app_id      = '286214348393614'
      config.facebook_app_secret  = 'fe56812591fad8625997a9ceecc133bf'
      config.ga_tracking_code     = 'UA-82041608-2'
      config.hotjar_id            = 281790
      config.slack_webhook        = "https://hooks.slack.com/services/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x"
    end

    config
  end

  def rollbar
    'a7c214f1a0164e748d688ef15cc1c9ea'
  end

  def firebase
    Firebase::Client.new(configure.firebase)
  end

  def redis
    Redis.new(configure.redis)
  end

  def no_reply
    'no-reply@wadealike.com'
  end

  def generate_code(digit = 5)
    o = [(0..9), ('A'..'Z')].map { |i| i.to_a }.flatten
    o = o - [0 , 'O', 'I', 'L', 1]
    (0...digit).map { o[rand(o.length)] }.join
  end

  def generate_qr_code(qr)
    if qr.nil?
      tmp = "public/QRCode/#{qr.class.name}.png"
    else
      tmp = "public/QRCode/#{qr.class.name}-#{qr.code}.png"
    end

    RQRCode::QRCode.new(qr.code, size: 4, level: :h).to_img.resize(120, 120).save(tmp)
  end

  def limit_buy_ticket
    10
  end

  def facebook_link
    ENV['FACEBOOK_LINK']
  end

  def line_link
    ENV['LINE_LINK']
  end

  def instagram_link
    ENV['INSTAGRAM_LINK']
  end

  def twitter_link
    ENV['TWITTER_LINK']
  end

  class << self
    attr_accessor :current

    def method_missing(meth, *args, &block)
      current.send(meth, *args, &block)
    end
  end

  self.current = new
end
