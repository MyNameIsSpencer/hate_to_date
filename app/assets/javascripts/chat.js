addEventListener('DOMContentLoaded', function(){
  logged_in.innerText = location.search.substr(1);

  const chats_channel = App.cable.subscriptions.create('ChatsChannel',{
    connected:    () => {messages.append('connected\n');},
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
    chats_channel.send({username, message})
    text_message.value=""
  })
})
