if ENV['AWS_KEY'] && ENV['AWS_SECRET']

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET'],
    region: 'us-east-1',
    endpoint: 'https://s3.amazonaws.com'
  }
  if Rails.env.production?
    config.fog_directory  = 'apphoster'                     # required
  else
    config.fog_directory  = 'apphosterdev'                     # required
  end
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

end
