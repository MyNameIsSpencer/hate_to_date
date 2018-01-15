class ChatsController < ApplicationController

  def chat_room
    @current_user = current_user
    @receiver = User.find_by(id: params[:receiver])
    @messages = Message.where(["user_id = ? and receiver_id = ? OR user_id = ? and receiver_id = ?", current_user.id, params[:receiver].to_i, params[:receiver].to_i, current_user.id]).order(created_at: :asc).pluck(:body, :user_id, :created_at)
    @messages.map {|m| m[1]=User.find(id=m[1]).name}

    respond_to do |format|
      format.html
      format.json { render :json => {message: @messages, sender: @current_user} }
    end
  end
end
