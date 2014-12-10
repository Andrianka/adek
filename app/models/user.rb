class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders

	ROLE = [Owner = 'owner', Admin = 'admin', Client = 'client']

	def name
		if self.first_name.blank?
			self.email
		else
			"#{self.first_name} #{self.last_name}"
		end
	end

	def admin?
		self.role == User::Admin
	end

	def client?
		self.role == User::Client
	end

	def owner?
		self.role == User::Owner
	end
end
