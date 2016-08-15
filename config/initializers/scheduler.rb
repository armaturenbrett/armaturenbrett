require 'rufus-scheduler'

$widget_scheduler = Rufus::Scheduler.singleton

$config = {}
Dir["#{Rails.root}/config/widgets/*.yml"].each do |file|
  widget_name = File.basename(file, ".yml" )
  $config[widget_name] = YAML.load_file(file)[widget_name]
end

Dir["#{Rails.root}/app/jobs/widgets/*.rb"].each {|file| require file }
