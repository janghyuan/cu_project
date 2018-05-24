class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index]
  before_action :correct_user_for_users_controller, only: [:show]
  before_action :admin_user_redi, only: [:index]
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params[:id]) 
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      log_in @user
      flash[:success] = 'You have successfully created your account!'
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:nickname, :email, :password, :password_confirmation) 
  end
end
