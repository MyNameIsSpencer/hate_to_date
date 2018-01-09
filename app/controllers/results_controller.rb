class ResultsController < ApplicationController

def create
  @result = Result.new
  @result.user_id = params[:results][:user_id].to_i
  @result.survey_id = params[:results][:survey_id].to_i
  @result.answers =params[:results][:answers]
  @result.save


end

end
