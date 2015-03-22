class RegisterUserController < ApplicationController
  def index
    @register = User.all
  end

  def new
    @register = User.new
  end

  def create
    @register = User.new(register_params)
    if @register.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
  end

  def edit
  end

  private
  def register_params
    params.permit(:email, :password, :confirm_password)
  end
end
