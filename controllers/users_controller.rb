class UsersController < ResourceController

  def update
    if params[:user][:current_password].empty?
      params[:user].delete :password_confirmation
      params[:user].delete :password
      params[:user].delete :current_password
      @user.accept_invitation!
    end

    super
  end

  def disable
    @user = User.find(params[:id])
    @user.disable
    if @user.save
      redirect_to :back
    else
      render_errors @user
      redirect_to @user
    end
  end

  def enable
    @user = User.find(params[:id])
    @user.enable
    if @user.save
      redirect_to :back
    else
      render_errors @user
      redirect_to @user
    end
  end
end
