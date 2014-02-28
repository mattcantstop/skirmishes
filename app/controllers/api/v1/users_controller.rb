class Api::V1::UsersController < Api::V1::BaseController

  before_filter :find_user, :only => [:show, :update, :destroy]

  def show
    if !@user.is_disabled?
      render 'users/show.rabl'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render('users/show.rabl', object: @user, status: 201)
    else
      render_errors(@user)
    end
  end

  def update
    if @user.update_attributes(user_params)
      render('users/show.rabl', object: @user)
    else
      render_errors(@user)
    end
  end

  def destroy
    @user.is_disabled = true
    if @user.save
      head :no_content
    else
      render_errors(@user)
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
    if @user.is_disabled?
      render('users/404.rabl', status: 404)
    else
      @user
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
