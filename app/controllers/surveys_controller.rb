class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])
    @result = {}
    @test_results = {}
    @survey.questions.each do |question|
      res1 = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["PokeGif_Key"]}&q=#{question.option_a}&rating=g")
      body1 = JSON.parse(res1.body)
      res2 = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["PokeGif_Key"]}&q=#{question.option_b}&rating=g")
      body2 = JSON.parse(res2.body)
      gif_url1 = body1["data"][rand(0..body1["data"].length-1)]["images"]["fixed_height_still"]["url"]
      gif_url2 = body2["data"][rand(0..body2["data"].length-1)]["images"]["fixed_height_still"]["url"]
      @result[gif_url1] = gif_url2
      @test_results[question.option_a] = question.option_b
    end
  end

end
