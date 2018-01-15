class UsersController < ApplicationController
	before_action :ensure_logged_in, except: [:new, :create]


  def new
		@user = User.new
	end


  def create
  @user = User.create(user_params)
  if @user.save!

    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  else
    render :new
  end
end

def show
  @users = User.all
  @user = User.find_by(id: params[:id])
  unless current_user.user_matches.include?(@user) || @user ==current_user
    redirect_to new_session_path
  end
  @results = Result.all
  @surveys= Survey.all
end



def edit
  @user = current_user
end

def update
  @user = current_user
  @user.name = params[:user][:name]
  @user.email = params[:user][:email]
  if @user.save
    redirect_to user_url
  else
    render :edit
  end
end

def destroy
  @user = current_user
  session[:user_id] = nil
  @user.destroy
  redirect_to new_user_url
end

def load_matches
  @user = current_user
  @users = User.all
  @results = Result.all
  @surveys = Survey.all
end

def meetups
	@user = current_user
	@user_surveys = []
	@user_meetups = []
	@user.results.each do |result|
		if @user_surveys.include?(Survey.all.find(result.survey_id).name) ==false
			@user_surveys << Survey.all.find(result.survey_id).name
		end
	end
	@user_surveys.each do |survey|
		result = HTTParty.get("https://api.meetup.com/find/groups?&key=#{ENV["Meetup_Key"]}&sign=true&photo-host=public&country=CA&text=#{survey}&page=20")
		@user_meetups << result
	end
end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def user_params
  params.require(:user).permit(:avatar, :fsa_id, :name, :email, :phone, :privacy, :password, :password_confirmation, :fsa_id, :pet_peeves, :description )
end

end
