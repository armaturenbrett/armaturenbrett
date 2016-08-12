# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WidgetDataChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{params[:widget]}_widget"

    widget_datum = WidgetDatum.find(widget_name)
    ActionCable.server.broadcast "#{widget_name}_widget",
                                 widget_datum.data if widget_datum
  end

  def unsubscribed
  end
end
