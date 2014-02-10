CarrierWave.configure do |config|

  config.cache_dir = File.join(Rails.root, 'tmp', 'uploads')

  #case Rails.env.to_sym

  #when :development
  config.storage = :file
  config.root = File.join(Rails.root, 'public')

  #when :production
    # the following configuration works for Amazon S3
    #config.storage          = :fog
    #config.fog_credentials  = {
    #  provider:                 'AWS',
    #  aws_access_key_id:        'AKIAJ3ZSIH5CSYJVKABA',
    #  aws_secret_access_key:    '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',
    #  region:                   'eu-west-1'
    #}
    #config.fog_directory    = 'iwant-staging'

  #else
    # settings for the local filesystem
    #config.storage = :file
    #config.root = File.join(Rails.root, 'public')
  #end

end
