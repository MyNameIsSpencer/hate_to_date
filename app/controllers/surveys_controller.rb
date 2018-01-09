class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])
    @results = {}
    @survey.questions.each do |question|
      @results[question.option_a] = question.option_b
    end
  end

end
