App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    element = document.createElement('div')
    element.className = 'message'
    element.innerHTML = "<p>#{data.message}</p>"
    document.getElementById('messages').appendChild(element)

  post_message: (message) -> # 修正
    @perform 'post_message', message: message #修正

  document.addEventListener('DOMContentLoaded', () ->
    form = document.getElementById('message_form')
    form.addEventListener('submit', (event) ->
      event.preventDefault()
      input = document.getElementById('message_field').value
      App.room.post_message(input)
      document.getElementById('message_field').value = ''
    )
  )
