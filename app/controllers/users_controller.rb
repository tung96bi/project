class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
  end
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = t "static_pages.home.sample_app"
      redirect_to @user
  	else
  	  render :new
  	end
  end

  private
    def user_params
      params.require(:user).permit :name, :email, :password, :password_confirmation,
        :birthday, :gender
    end
end
