require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.asset_host = 'https://s3.amazonaws.com/engineer-road'
    # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
  config.fog_public = false # ←コレ
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: "AWS_ACCESS_KEY_ID",
    aws_secret_access_key: "AWS_SECRET_ACCESS_KEY",
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'engineer-road'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/engineer-road'
end