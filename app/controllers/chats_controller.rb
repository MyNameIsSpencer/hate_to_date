class ChatsController < ApplicationController

  def chat_room
    @current_user = current_user.name
  end
end
