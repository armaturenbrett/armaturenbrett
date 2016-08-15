namespace :widget do
  desc 'installs a widget with the given name'
  task :install, [:widget] do |t, args|
    widget = args[:widget]
    `widget_path=$(readlink -f ../#{widget.tr('_', '-')})
    ln -s "$widget_path/#{widget}.coffee" "app/assets/javascripts/widgets/#{widget}.coffee"
    ln -s "$widget_path/#{widget}.scss" "app/assets/stylesheets/widgets/#{widget}.scss"
    ln -s "$widget_path/#{widget}.rb" "app/jobs/widgets/#{widget}.rb"
    ln -s "$widget_path/#{widget}.slim" "app/views/widgets/_#{widget}.slim"
    touch "config/widgets/#{widget}.yml"`

    puts "\nrender your widget in app/views/application/dashboard.slim with something like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end

  desc 'uninstalls a widget with the given name'
  task :uninstall, [:widget] do |t, args|
    widget = args[:widget]
    `rm "app/assets/javascripts/widgets/#{widget}.coffee"
    rm "app/assets/stylesheets/widgets/#{widget}.scss"
    rm "app/jobs/widgets/#{widget}.rb"
    rm "app/views/widgets/_#{widget}.slim"
    rm "config/widgets/#{widget}.yml"`

    puts "\nremove your widget rendering from app/views/application/dashboard.slim which could like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end

  desc 'reinstalls a widget with the given name'
  task :reinstall, [:widget] do |t, args|
    widget = args[:widget]
    Rake.application.invoke_task("widget:uninstall[#{widget}]")
    Rake.application.invoke_task("widget:install[#{widget}]")
  end
end
