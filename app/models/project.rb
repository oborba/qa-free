class Project < ActiveRecord::Base
	validates_presence_of :name, :description, message: ": Deve ser preenchido"
end
