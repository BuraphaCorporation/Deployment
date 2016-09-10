class App < Struct.new(:region, :environment, :version)

  def initialize(attrs = {})
    defaults              = YAML.load_file('config/instance.yml') rescue nil
    attrs                 = (defaults || {}).with_indifferent_access.merge(attrs)
    attrs[:region]      ||= 'th'
    attrs[:environment] ||= ['production', 'provisioning'].include?(ENV['RAILS_ROOT']) ? 'staging' : ENV['RAILS_ROOT'] || 'development'
    attrs[:version]     ||= 'master'
    attrs.each_pair { |k, v| self[k] = v.inquiry }
  end

  def domain(subdomain=nil)
    protocol + '//' + case subdomain
                      when 'api'
                        "#{api_host}.#{root_domain}#{port}"
                      else
                        if environment.production?
                          "#{root_domain}"
                        else
                          "#{host}.#{root_domain}#{port}"
                        end
                      end
  end

  def blog
    protocol + '//blog.' + root_domain
  end

  def root_domain
    'daydash.co'
  end

  def protocol
    environment.development? ? 'http:' : 'https:'
  end

  def port
    if environment.development?
      ':1337'
    end
  end

  def host
    case environment
    when 'staging', 'brick'
      'brick'
    when 'non'
      'dev-non'
    when 'pop'
      'dev-pop'
    when 'development'
      'dev'
    else
      ''
    end
  end

  def api_host
    case environment
    when 'production'
      'api'
    when 'staging', 'brick'
      'brick-api'
    when 'development'
      'dev-api'
    end
  end

  # def is_admin?
  #   $admin
  # end

  def configure
    config = OpenStruct.new

    case environment
    when 'production', 'staging', 'brick'
      config.facebook_app_id      = '259929777688738'
      config.facebook_app_secret  = 'bdaef0f0beb25366bef19febf2366312'
    when 'production'
      config.firebase             = 'https://daydash.firebaseio.com/'
      config.redis                = { host: 'redis.daydash.co', port: 6379, timeout: 25 }
    when 'staging', 'brick'
      config.firebase             = 'https://daydash-staging.firebaseio.com/'
      config.redis                = { host: 'redis-staging.daydash.co', port: 6379, timeout: 25 }
    else
      config.firebase             = 'https://daydash-development.firebaseio.com/'
      config.redis                = { host: '127.0.0.1', port: 6379, timeout: 25 }
      config.facebook_app_id      = '286214348393614'
      config.facebook_app_secret  = 'fe56812591fad8625997a9ceecc133bf'
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
    'no-reply@daydash.co'
  end

  def generate_code(digit = 5)
    o = [(0..9), ('A'..'Z')].map { |i| i.to_a }.flatten
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

  class << self
    attr_accessor :current

    def method_missing(meth, *args, &block)
      current.send(meth, *args, &block)
    end
  end

  self.current = new
end
