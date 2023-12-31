class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :require_user, only: [:edit,:update]
  before_action :require_same_user, only: [:edit, :update]
  def show
    @article = @user.articles.paginate(page: params[:page], per_page: 5)
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  def index
    @users = User.paginate(page: params[:page], per_page:5)
  end
  def new
    @user = User.new
  end
  def edit
  end
  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "welcome to the blog #{@user.username}, successfully signed up"
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    flash[:alert] = "You can edit your own account"
    redirect_to @user
  end


end


