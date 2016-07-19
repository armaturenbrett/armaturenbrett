class WidgetDatum

  class_attribute :name
  class_attribute :data

  require 'redis'
  @redis ||= Redis.new

  def self.new(params)
    self.name = params[:name]
    self.data = params[:data]
    self
  end

  def self.all
    @redis.hgetall('*')
  end

  def self.save
    ActionCable.server.broadcast 'widget_data',
                                 name: self.name,
                                 data: self.data
    @redis.set(self.name, self.data.to_json)
  end

  def self.update(params)
    self.new(params)
    self.save
  end

  def self.find(name)
    data = @redis.get(name)
    return nil unless data
    data = JSON.parse(data) rescue nil
    WidgetDatum.new(name: name, data: data)
  end

  def self.destroy
    @redis.del(self.name)
  end
end
