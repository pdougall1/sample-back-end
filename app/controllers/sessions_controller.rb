require 'byebug'

class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: :create

  def create
    identifier = session_params[:identification]
    password = session_params[:password]
    session = Session.create(identifier, password)
    render json: session.response, status: session.response_status
  end

  def destroy
    @user = current_user.delete :hashed_authentication_token
  end

  private

  def session_params
    params.permit(:password, :identification)
  end
end
