#= require cable
#= require_self
#= require_tree .

this.App = {}
App.cable = ActionCable.createConsumer()
App.messages = App.cable.subscriptions.create('WidgetDataChannel',
  received: (data) ->
    console.log(data)
    $('#messages').removeClass 'hidden'
    $('#messages').append @renderMessage(data)
  renderMessage: (data) ->
    '<p> <b>' + data.user + ': </b>' + data.message + '</p>'
)
