class SessionsController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      render :new
    end
  end
end
