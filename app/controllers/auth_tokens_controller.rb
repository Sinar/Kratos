class AuthTokensController < ApplicationController

  before_filter :authenticate_user!

  def create
    p params
    @user = User.find(params[:id])
    @user.reset_authentication_token!
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.authentication_token = nil
    @user.save
    redirect_to user_path(@user)
  end

end
