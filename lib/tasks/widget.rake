namespace :widget do
  desc 'installs a widget with the given name'
  task :install, [:widget] do |t, args|
    widget = args[:widget]
    `cd ../config/javascripts && ln -vs ../../#{widget}/#{widget}.coffee`
    `cd ../config/stylesheets && ln -vs ../../#{widget}/#{widget}.scss`
    `cd ../config/jobs && ln -vs ../../#{widget}/#{widget}.rb`
    `cd ../config/views/widgets && ln -vs ../../../#{widget}/#{widget}.slim`
    `cd ../config/widgets && ln -vs ../../#{widget}/#{widget}.yml`

    `cp -v ../#{widget}/#{widget}.yml ../config/widgets/`
    `cp -v ../#{widget}/locales/*#{widget}.yml ../config/locales/`

    puts "\nrender your widget in ../config/views/dashboard.slim with something like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end

  desc 'uninstalls a widget with the given name'
  task :uninstall, [:widget] do |t, args|
    widget = args[:widget]

    `rm -v ../config/javascripts/#{widget}.coffee`
    `rm -v ../config/stylesheets/#{widget}.scss`
    `rm -v ../config/jobs/#{widget}.rb`
    `rm -v ../config/views/widgets/#{widget}.slim`
    `rm -v ../config/widgets/#{widget}.yml`

    `rm -v ../config/widgets/#{widget}.yml`
    `rm -v ../config/locales/*#{widget}.yml`

    puts "\nremove your widget rendering from ../config/views/dashboard.slim which could look like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end

  desc 'reinstalls a widget with the given name'
  task :reinstall, [:widget] do |t, args|
    widget = args[:widget]
    Rake.application.invoke_task("widget:uninstall[#{widget}]")
    Rake.application.invoke_task("widget:install[#{widget}]")
  end
end
