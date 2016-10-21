
Rails.application.configure do |config|
  config.paperclip_defaults = {
    storage: :s3,
    s3_host_name:         's3-ap-southeast-1.amazonaws.com',
    s3_protocol:          'https',
    url:                  ':s3_domain_url',
    path:                 '/:class/:attachment/:id_partition/:style/:filename',
    s3_credentials: {
      bucket:             ENV.fetch('S3_BUCKET_NAME'),
      access_key_id:      ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key:  ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region:          ENV.fetch('AWS_REGION'),
    }
  }
end

# Aws.config.update({
#   region: ENV.fetch('AWS_REGION'),
#   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
# })
#
# S3_BUCKET_NAME = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET_NAME'])


# Paperclip::Attachment.default_options[:s3_host_name]  = 's3-ap-southeast-1.amazonaws.com'
# Paperclip::Attachment.default_options[:s3_protocol]   = 'https'
# Paperclip::Attachment.default_options[:url]           = ':s3_domain_url'
# # Paperclip::Attachment.default_options[:path]          = '/:class/:attachment/:style/:filename'
# Paperclip::Attachment.default_options[:path]          = '/:class/:attachment/:id_partition/:style/:filename'
