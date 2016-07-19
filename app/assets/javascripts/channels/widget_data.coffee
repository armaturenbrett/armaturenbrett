App.widget_data = App.cable.subscriptions.create 'WidgetDataChannel',
  connected: ->
    console.log('connected')

  disconnected: ->
    console.log('disconnected')

  received: (data) ->
    console.log('received data:', data)
