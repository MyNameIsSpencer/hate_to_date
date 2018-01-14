class ChatsChannel < ApplicationCable::Channel

  def subscribed
      
      @room = params[:room].sort
      stream_from "chat_#{@room[0]}_#{@room[1]}"
  end

  def receive(data)

    ActionCable.server.broadcast("chat_#{@room[0]}_#{@room[1]}", data)

  end

end
