# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener('DOMContentLoaded', () ->
  form = document.getElementById('message_form')
  form.addEventListener('submit', (event) ->
    event.preventDefault()
    input = document.getElementById('message_field').value
    App.room.post_message(input)
    document.getElementById('message_field').value = ''
  )
)
