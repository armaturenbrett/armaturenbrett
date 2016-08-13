# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WidgetDataChannel < ApplicationCable::Channel
  def subscribed
    widget = params[:widget]
    stream_from "#{widget}_widget"

    widget_datum = WidgetDatum.find(widget)
    ActionCable.server.broadcast "#{widget}_widget",
                                 widget_datum.data if widget_datum
  end

  def unsubscribed
  end
end
