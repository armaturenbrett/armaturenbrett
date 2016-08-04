require 'rufus-scheduler'

$widget_scheduler = Rufus::Scheduler.singleton

Dir["#{Rails.root}/app/jobs/widgets/*.rb"].each {|file| require file }
