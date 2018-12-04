class UsersController < ApplicationController


  def show
    @user = User.current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to town_path(@town)
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end

end
