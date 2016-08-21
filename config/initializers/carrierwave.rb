CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id:'AKIAIG7OKTNMNO5OJJDQ',
      aws_secret_access_key: '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',
      region: 'us-west-2',
  }
  config.fog_directory = 'speekdevcloud'
end