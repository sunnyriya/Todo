App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
        if data['val']!=1
         $('#chat').show();
         $('#messages').animate({ scrollTop:  $('#messages').get(0).scrollHeight}, "fast");
         $('#messages').append(data["user"]+data["message"])
         $('#messages').append("<br>")
         $('#typing_field').html('')
         console.log(data['user'])

        else 
         $('#typing_field').html(' is typing...')


  speak: (message) -> 
    @perform 'speak', message: message, user: $("#chat_cake").attr("data-user")+": "

$(document).on 'keypress', '#chat-speak', (event) -> 
  if event.keyCode is 13 
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
