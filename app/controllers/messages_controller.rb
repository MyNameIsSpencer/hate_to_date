class MessagesController < ApplicationController

  def find_event
    @topic = params[:topic]
    @city = current_user.fsa.name
    @ticket_master_event = HTTParty.get("https://app.ticketmaster.com/discovery/v2/attractions.json?keyword=#{@topic}&apikey=#{ENV["Discovery_Key"]}")
    respond_to do |format|
      format.html
      format.json { render :json => @ticket_master_event }
    end
  end

  def create
    @message=Message.new
    @message.body=params[:body]
    @message.user_id=current_user.id
    @message.receiver_id= params[:receiver]
    @message.save
  end

end
