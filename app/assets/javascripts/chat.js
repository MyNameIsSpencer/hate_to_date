addEventListener('DOMContentLoaded', function(){
  // This function is used to create the message and send it to the messages div, also determines whether its sender or receiver message
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
  // This function calls on databse to mark message as having been read if recceiver loads it on his chat
  function readMessage (messageId){
    $.ajax({
      url: 'read_message',
      dataType: 'json',
      method: "PATCH",
      data:{id: messageId}
    })
  }
  // This ajax call retrieve the messages bewteen the 2 users from database
  $.ajax({
    url: 'chat_room',
    dataType: 'json',
    method: 'GET',
    data: {receiver: parseInt($("#receiver").val())}
  }).done(function(data){
    var userMessages = data["message"]
    const chats_channel = App.cable.subscriptions.create({channel: 'ChatsChannel', room: [data["sender"], parseInt($("#receiver").val())]}, {
      // room parameter is used by the chats channel to create the correct chat room from user and receiver ids
    connected:    () => {
      messages.innerText = ""
      userMessages.forEach(function(message){
        loadMessage (message[1], message[0])
        if (message[4]===false){ // calls read message function only if message is marked as unread ie read=false
          readMessage (message[3])
        }
      })
    },

    disconnected: () => {messages.append('disconnected\n');},

    received:  data  => {
      // similar to loading messages on connected just using a different data paramter from the form being submitted
      loadMessage (data.username, data.message)
      readMessage (data.id)
    }
  })
  // This form creates the message instance when submitted and sends to chat div
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
