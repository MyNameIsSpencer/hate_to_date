class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])

  end

  def load_pictures
    @survey = Survey.find_by(id: params[:survey_id])
    @pictures = []
    left_pic = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["Giphy_Key"]}&q=#{@survey.questions[params[:number].to_i].option_a}&rating=g")
    right_pic = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["Giphy_Key"]}&q=#{@survey.questions[params[:number].to_i].option_b}&rating=g")
    @pictures << left_pic
    @pictures << right_pic
    @pictures << @survey.questions.length
    respond_to do |format|
      format.html
      format.json { render :json => @pictures }
    end


  end

end
