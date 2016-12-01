namespace :armaturenbrett do
  desc "initializes the armaturenbrett including the structure of parent directory"
  task init: :environment do
    `cd .. && git init`

    `mkdir -p ../config`
    `mkdir -p ../config/widgets`
    `mkdir -p ../config/locales`

    `git update-index --assume-unchanged app/views/application/dashboard.slim`
    `mv app/views/application/dashboard.slim ../config/`
    `cd app/views/application && ln -s ../../../../config/dashboard.slim dashboard.slim`

    `git update-index --assume-unchanged config/widgets`
    `rm -rf config/widgets`
    `cd config && ln -s ../../config/widgets widgets`
  end
end
