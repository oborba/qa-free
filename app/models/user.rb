class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :email, :password, :confirm_password
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
