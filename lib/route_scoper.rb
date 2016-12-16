require 'rails/application'

module RouteScoper
  def self.root
    Rails.application.config.root_directory
  rescue NameError
    '/'
  end
end
