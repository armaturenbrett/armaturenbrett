class WidgetDataChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'widget_data'
  end
end
