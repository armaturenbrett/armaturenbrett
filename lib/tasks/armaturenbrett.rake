namespace :armaturenbrett do
  desc "initializes the armaturenbrett including the structure of parent directory"
  task init: :environment do
    `mkdir -p ../config`
    `mkdir -p ../config/views`
    `mkdir -p ../config/stylesheets`
    `mkdir -p ../config/widgets`
    `mkdir -p ../config/locales`

    `cp app/views/application/dashboard.slim.example ../config/views/dashboard.slim`
    `cp app/assets/stylesheets/dashboard.scss.example ../config/stylesheets/dashboard.scss`
  end
end
