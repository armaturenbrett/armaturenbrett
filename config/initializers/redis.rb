require 'redis'

if ENV['REDIS_DB'].present?
  $redis = Redis.new(db: ENV['REDIS_DB'])
else
  $redis = Redis.new
end
