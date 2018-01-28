addEventListener('DOMContentLoaded', function(){

  function loadMessage (userName, text){
    var nameHolder = document.createElement('div')
    nameHolder.className = "name"
    var textHolder = document.createElement('div')
    textHolder.className = "text"
    nameHolder.innerText = userName + ":"
    textHolder.innerText = text
    var messageHolder = document.createElement('div')
    messageHolder.append(nameHolder)
    messageHolder.append(textHolder)
    if (userName === user.value){
      messageHolder.className = 'user_message'
    } else {
      messageHolder.className = 'receiver_message'
    }
    messages.append(messageHolder)
  }

  $.ajax({
    url: 'chat_room',
    dataType: 'json',
    method: 'GET',
    data: {receiver: parseInt($("#receiver").val())}
  }).done(function(data){
    var userMessages = data["message"]
    const chats_channel = App.cable.subscriptions.create({channel: 'ChatsChannel', room: [data["sender"], parseInt($("#receiver").val())]}, {
    connected:    () => {
      messages.innerText = ""
      userMessages.forEach(function(message){
        loadMessage (message[1], message[0])
        // var nameHolder = document.createElement('div')
        // nameHolder.className = "name"
        // var textHolder = document.createElement('div')
        // textHolder.className = "text"
        // nameHolder.innerText = message[1] + ":"
        // textHolder.innerText = message[0]
        // var messageHolder = document.createElement('div')
        // messageHolder.append(nameHolder)
        // messageHolder.append(textHolder)
        // if (message[1] === user.value){
        //   messageHolder.className = 'user_message'
        // } else {
        //   messageHolder.className = 'receiver_message'
        // }
        // messages.append(messageHolder)
        if (message[4]===false){
          $.ajax({
            url: 'read_message',
            dataType: 'json',
            method: "PATCH",
            data:{id: message[3]}
          })
        }
      })
    },
    disconnected: () => {messages.append('disconnected\n');},
    received:  data  => {
      loadMessage (data.username, data.message)
      // var nameHolder = document.createElement('div')
      // nameHolder.className = "name"
      // var textHolder = document.createElement('div')
      // textHolder.className = "text"
      // nameHolder.innerText = data.username + ":"
      // textHolder.innerText = data.message
      // var messageHolder = document.createElement('div')
      // messageHolder.append(nameHolder)
      // messageHolder.append(textHolder)
      // messages.append(messageHolder)
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
      }).done(function(data){
        const id = data;
        chats_channel.send({username, message, id})
        text_message.value=""
      })
    })
  })
})
