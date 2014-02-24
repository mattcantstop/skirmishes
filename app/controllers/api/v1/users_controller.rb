class Api::V1::UsersController < Api::V1::BaseController

  before_filter :find_user, :only => [:show, :update, :destroy]


  def show
    render 'users/show.rabl'
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
    if @user.update_attributes
      render('users/show.rabl', object: @user)
    else
      render_errors(@user)
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
