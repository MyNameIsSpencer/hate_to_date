class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])

  end

  def load_pictures
    @survey = Survey.find(params[:id])
    @questions = {}
    @survey.questions.each do |question|
      @questions[question.option_a] = question.option_b
    end
    @pictures = []
    left_pic = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["Giphy_Key"]}&q=#{@questions.keys[params[:number].to_i]}&rating=g")
    right_pic = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["Giphy_Key"]}&q=#{@questions.values[params[:number].to_i]}&rating=g")
    @pictures << left_pic
    @pictures << right_pic
    @pictures << @questions.keys.length
    respond_to do |format|
      format.html
      format.json { render :json => @pictures }
    end
    

  end

end
