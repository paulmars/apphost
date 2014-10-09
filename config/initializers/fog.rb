if ENV['AWS_KEY'] && ENV['AWS_SECRET']

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET'],
    region: 'us-east-1',
    endpoint: 'http://s3.amazonaws.com'
  }
  if Rails.env.production?
    config.fog_directory  = 'apphosterd'                     # required
  else
    config.fog_directory  = 'apphosterd'                     # required
  end
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

end
