namespace :widget do
  desc 'installs a widget with the given name'
  task :install, [:widget] do |t, args|
    widget = args[:widget]
    `widget_path=$(realpath ../#{widget})
    ln -s "$widget_path/#{widget}.coffee" "app/assets/javascripts/widgets/#{widget}.coffee"
    ln -s "$widget_path/#{widget}.scss" "app/assets/stylesheets/widgets/#{widget}.scss"
    ln -s "$widget_path/#{widget}.rb" "app/jobs/widgets/#{widget}.rb"
    ln -s "$widget_path/#{widget}.slim" "app/views/widgets/_#{widget}.slim"`

    puts "\nrender your widget in app/views/application/dashboard.slim with something like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end

  desc 'uninstalls a widget with the given name'
  task :uninstall, [:widget] do |t, args|
    widget = args[:widget]
    `rm "app/assets/javascripts/widgets/#{widget}.coffee"
    rm "app/assets/stylesheets/widgets/#{widget}.scss"
    rm "app/jobs/widgets/#{widget}.rb"
    rm "app/views/widgets/_#{widget}.slim"`

    puts "\nremove your widget rendering from app/views/application/dashboard.slim which could like the following:\n\n\t" \
         "= render 'widgets/#{widget}'\n\n"
  end
end
