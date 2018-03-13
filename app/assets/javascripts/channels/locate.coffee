$(document).on "turbolinks:load", ->
  if $(".locations.show").length > 0
    App.locate = App.cable.subscriptions.create "LocateChannel",
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        add_marker(data)

      put_latlng: (lat,lng) ->
        @perform('put_latlng', { latitude: lat,longitude: lng })