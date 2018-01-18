addEventListener('DOMContentLoaded', function(){
  $.ajax({
    url: 'chat_room',
    dataType: 'json',
    method: 'GET',
    data: {receiver: parseInt($("#receiver").val())}
  }).done(function(data){
    console.log(data);
    console.log('Success');
    var userMessages = data["message"]
    var sender = data["sender"]
    const chats_channel = App.cable.subscriptions.create({channel: 'ChatsChannel', room: [sender.id, parseInt($("#receiver").val())]}, {
    connected:    () => {
      userMessages.forEach(function(message){
        messages.append(message[1] + ": " + message[0] + "\n")
      })
    },
    disconnected: () => {messages.append('disconnected\n');},
    received:  data  => {
      messages.append(`${data.username}: ${data.message}\n`)
        console.log('Received data from server:', data);
    }
  }).fail(function(data){
    console.log(data);
    console.log('failure');
  })
  form_message.addEventListener("submit", e => {
    e.preventDefault();
    const message = text_message.value
    const username = user.value
    const receiver = $("#receiver").val()
    console.log(message);
    console.log(username);
    console.log(receiver);
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
