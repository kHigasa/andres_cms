if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }

    config.fog_directory = 'andrescms'
    config.cache_storage = :fog
    config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/andrescms'
    config.cache_dir = Rails.root.join('tmp', 'uploads')
  end
end
# For text garbling
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
