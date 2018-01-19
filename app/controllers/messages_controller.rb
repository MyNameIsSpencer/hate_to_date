class MessagesController < ApplicationController

  def find_event
    @topic = params[:topic]
    @latitude = current_user.fsa.latitude
    @longitude = current_user.fsa.longitude
    @ticket_master_event = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?keyword=#{@topic}&latlong=#{@latitude},#{@longitude}&radius=100&apikey=#{ENV["Discovery_Key"]}")
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
    @message.save unless User.find(params[:receiver]).blocks.include?(current_user.id)
  end

end
