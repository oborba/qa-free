class RegisterUserController < ApplicationController
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
    params.require(:register_user).permit(:email, :password, :confirm_password)
  end
end
