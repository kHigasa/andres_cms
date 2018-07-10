CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAI5QGWJYRRGBQ436A',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory = 'andrescms'
  config.cache_storage = :fog
  config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/andrescms'
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
