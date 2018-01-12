addEventListener('DOMContentLoaded', function(){
  logged_in.innerText = location.search.substr(1);
  $.ajax({
    url: 'chat_room',
    dataType: 'json',
    method: 'GET'
  }).done(function(data){
    var userMessages = data["message"]
    var sender = data["sender"]
    const chats_channel = App.cable.subscriptions.create('ChatsChannel',{
    connected:    () => {
      userMessages.forEach(function(message){
        messages.append(sender + ": " + message[0] + "\n")
      })
    },
    disconnected: () => {messages.append('disconnected\n');},
    received:  data  => {
      messages.append(`${data.username}: ${data.message}\n`)
        console.log('Received data from server:', data);
    }
  })
  form_message.addEventListener("submit", e => {
    e.preventDefault();
    const message = text_message.value
    const username = user.value
    const receiver = $("#receiver").val()
    chats_channel.send({username, message})
    text_message.value=""
    $.ajax({
      url: 'messages#create',
      dataType: 'json',
      data: {body: message, receiver: receiver},
      method: "POST"
    })
    })
  })
})
