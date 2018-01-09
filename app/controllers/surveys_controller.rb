class SurveysController < ApplicationController

  def show
    @survey = Survey.find(params[:id])
    @questions = {}
    @survey.questions.each do |question|
      @questions[question.option_a] = question.option_b
    end

  end

end
