class SurveysController < ApplicationController
	before_action :ensure_logged_in, except: [:index]

def index
  @surveys =Survey.all
  @user_surveys =[]
end

  def show
    @survey = Survey.find(params[:id])
    @user= current_user
  end

end
