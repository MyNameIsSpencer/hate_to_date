addEventListener('DOMContentLoaded', function(){
  $.ajax({
    url: 'chat_room',
    dataType: 'json',
    method: 'GET',
    data: {receiver: parseInt($("#receiver").val())}
  }).done(function(data){
    var userMessages = data["message"]
    var sender = data["sender"]
    const chats_channel = App.cable.subscriptions.create({channel: 'ChatsChannel', room: [sender.id, parseInt($("#receiver").val())]}, {
    connected:    () => {
      messages.innerText = ""
      userMessages.forEach(function(message){
        messages.append(message[1] + ": " + message[0] + "\n")
        $.ajax({
          url: 'read_message',
          dataType: 'json',
          method: "PATCH",
          data:{id: message[3]}
        })
      })
    },
    disconnected: () => {messages.append('disconnected\n');},
    received:  data  => {
      messages.append(`${data.username}: ${data.message}\n`)
      $.ajax({
        url: 'read_message',
        dataType: 'json',
        method: "PATCH",
        data:{id: data.id}
      })

    }
  })

  form_message.addEventListener("submit", e => {
    e.preventDefault();
    const message = text_message.value
    const username = user.value
    const receiver = $("#receiver").val()
    $.ajax({
      url: 'messages#create',
      dataType: 'json',
      data: {body: message, receiver: receiver},
      method: "POST"
    }).done(function(data)
      {
        const id = data;
        chats_channel.send({username, message, id})
        text_message.value=""
      })
    })
  })
})
