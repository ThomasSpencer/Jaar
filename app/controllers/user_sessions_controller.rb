class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_to(:jars, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login Failed'
      render 'pages/landing.html.erb'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out')
  end
end
