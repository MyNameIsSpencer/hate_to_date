class SurveysController < ApplicationController
	before_action :ensure_logged_in, except: [:index]

def index
  @surveys =Survey.all
  @user_surveys =[]
end

  def show
    @survey = Survey.find(params[:id])
    @user= current_user
		@survey_done_today = false
		@user.results.each do |result|
			if result.survey_id == @survey.id && result.created_at.to_date == Date.today
				@survey_done_today = true
			end
		end
  end

end
