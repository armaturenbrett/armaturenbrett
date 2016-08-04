# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WidgetDataChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{params[:widget]}_widget"
  end

  def unsubscribed
  end
end
