class UsersController < ApplicationController
	before_action :ensure_logged_in, except: [:new, :create]

  def new
		@user = User.new
	end


  def create
  @user = User.new
  @user.name = params[:user][:name]
  @user.email = params[:user][:email]
  @user.phone = params[:user][:phone]
  @user.privacy = params[:user][:privacy]
  @user.password = params[:user][:password]
  @user.password_confirmation = params[:user][:password_confirmation]

  if @user.save
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect_to users_path
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
    redirect_to users_url
  else
    render :edit
  end
end

def destroy
  @user = current_user
  @user.destroy
  redirect_to new_users_url
end

def load_matches
  @user = current_user
  @users = User.all
  @results = Result.all
  @surveys = Survey.all
end

end
