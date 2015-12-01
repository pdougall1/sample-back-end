class UsersController < ApplicationController

  def show
    @user = AR::User.find(params[:id])
  end
end
