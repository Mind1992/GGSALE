require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "44f0a8ad194c552f20a609a25876db24fd41776794bca72e8660b26ffd6c0faf"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
  datastore :file,
            root_path: Rails.root.join('public/system/dragonfly', Rails.env),
            server_root: Rails.root.join('public')
	else
  datastore :s3,
            bucket_name: ENV['S3_BUCKET_NAME'],
            access_key_id: ENV['S3_KEY'],
            secret_access_key: ENV['S3_SECRET'],
            url_scheme: 'https'
	end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
