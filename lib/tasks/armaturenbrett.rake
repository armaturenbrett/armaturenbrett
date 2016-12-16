namespace :armaturenbrett do
  desc "initializes the armaturenbrett including the structure of parent directory"
  task init: :environment do
    `mkdir -p ../config`
    `mkdir -p ../config/jobs`
    `mkdir -p ../config/views`
    `mkdir -p ../config/views/widgets`
    `mkdir -p ../config/javascripts`
    `mkdir -p ../config/stylesheets`
    `mkdir -p ../config/widgets`
    `mkdir -p ../config/locales`

    `cp app/views/application/dashboard.slim.example ../config/views/dashboard.slim`
    `cp app/assets/stylesheets/dashboard.scss.example ../config/stylesheets/dashboard.scss`
  end

  desc "generates an authentification token"
  task generate_auth_token: :environment do
    auth_token = SecureRandom.hex
    $redis.hset('auth_tokens', auth_token, Time.zone.now)
    puts auth_token
  end
end
