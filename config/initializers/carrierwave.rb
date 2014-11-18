CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAI4IPEOU7OBVK5Z4A',                        # required
    :aws_secret_access_key  => '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',    # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    :host                   => 's3.example.com',             # optional, defaults to nil
    :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'superbots'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end

unless Rails.env.production?
  ENV["AWS_ACCESS_KEY_ID"]="AKIAI4IPEOU7OBVK5Z4A"
  ENV["AWS_SECRET_ACCESS_KEY"]="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"
end