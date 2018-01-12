class ChatsChannel < ApplicationCable::Channel

  def subscribed
      stream_from "chat_only"
  end

  def receive(data)
    ActionCable.server.broadcast("chat_only", data)
  end

end
