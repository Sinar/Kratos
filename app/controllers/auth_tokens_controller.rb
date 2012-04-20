class AuthTokensController < ApplicationController

  before_filter :authenticate_user!

  def create
    @user = User.find(params[:id])
    @user.reset_authentication_token!
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:authentication_token, nil)
    redirect_to user_path(@user)
  end

end
