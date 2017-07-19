CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET'],
      region: 'us-west-2'
    }
    config.fog_directory = 'speekdevcloud'
  end
end
