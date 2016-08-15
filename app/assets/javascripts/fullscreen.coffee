class Fullscreen
  constructor: ->
    this.enabled = false
    this.body = $('body')[0]

  toggle: ->
    return this.enable() unless this.enabled
    this.disable()

  enable: ->
    body = this.body
    if body.requestFullscreen
      body.requestFullscreen()
    else if body.webkitRequestFullscreen
      body.webkitRequestFullscreen()
    else if body.mozRequestFullScreen
      body.mozRequestFullScreen()
    else if body.msRequestFullscreen
      body.msRequestFullscreen()
    this.enabled = true

  disable: ->
    if document.exitFullscreen
      document.exitFullscreen()
    else if document.webkitExitFullscreen
      document.webkitExitFullscreen()
    else if document.mozCancelFullScreen
      document.mozCancelFullScreen()
    else if document.msExitFullscreen
      document.msExitFullscreen()
    this.enabled = false

$(document).ready ->
  window.fullscreen = new Fullscreen()
  $('*').on 'click', ->
    window.fullscreen.enable()
