class Api::V1::UsersController < Api::V1::BaseController

  def show
    @user = User.find(params[:id])
    respond_with(@user, :location => api_v1_user_path(@user))
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'users/show.json.rabl', :status => :created
    else
      render_errors(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
