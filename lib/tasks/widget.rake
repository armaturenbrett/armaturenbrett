namespace :widget do
  desc 'installs a widget with the given name'
  task :install, [:widget] do |t, args|
    widget = args[:widget]
    puts `cd ../config/javascripts && ln -v -s ../../#{widget}/#{widget}.coffee`
    puts `cd ../config/stylesheets && ln -v -s ../../#{widget}/#{widget}.scss`
    puts `cd ../config/jobs && ln -v -s ../../#{widget}/#{widget}.rb`
    puts `cd ../config/views/widgets && ln -v -s ../../../#{widget}/#{widget}.slim _#{widget}.slim`

    puts `cp -v ../#{widget}/#{widget}.yml ../config/widgets/`
    puts `cp -v ../#{widget}/locales/*#{widget}.yml ../config/locales/`

    puts "\nrender your widget in ../config/views/dashboard.slim with something like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end

  desc 'uninstalls a widget with the given name'
  task :uninstall, [:widget] do |t, args|
    widget = args[:widget]

    puts `rm -v ../config/javascripts/#{widget}.coffee`
    puts `rm -v ../config/stylesheets/#{widget}.scss`
    puts `rm -v ../config/jobs/#{widget}.rb`
    puts `rm -v ../config/views/widgets/#{widget}.slim`
    puts `rm -v ../config/widgets/#{widget}.yml`

    puts `rm -v ../config/widgets/#{widget}.yml`
    puts `rm -v ../config/locales/*#{widget}.yml`

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
