class Fullscreen
  constructor: ->
    this.enabled = false
    this.body = $('body')[0]

  toggle: ->
    return this.enable() unless this.enabled
    this.disable()

  enable: ->
    body = this.body
    body.requestFullscreen() if body.requestFullscreen
    body.webkitRequestFullscreen() if body.webkitRequestFullscreen
    body.mozRequestFullScreen() if body.mozRequestFullScreen
    body.msRequestFullscreen() if body.msRequestFullscreen
    this.enabled = true

  disable: ->
    document.exitFullscreen() if document.exitFullscreen
    document.webkitExitFullscreen() if document.webkitExitFullscreen
    document.mozCancelFullScreen() if document.mozCancelFullScreen
    document.msExitFullscreen() if document.msExitFullscreen
    this.enabled = false

$(document).ready ->
  window.fullscreen = new Fullscreen()
  $('*').on 'click', ->
    window.fullscreen.enable()
