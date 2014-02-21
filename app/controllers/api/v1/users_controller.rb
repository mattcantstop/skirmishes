class Api::V1::UsersController < Api::V1::BaseController

  def show
    @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
