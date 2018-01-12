class ChatsController < ApplicationController

  def chat_room
    @current_user = current_user
    @receiver = User.find_by(id: params[:receiver])
    @messages = Message.where(user_id: current_user.id).order(created_at: :asc).pluck(:body, :created_at)
    respond_to do |format|
      format.html
      format.json { render :json => {message: @messages, sender: @current_user.name} }
    end
  end
end
