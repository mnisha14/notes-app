class User < ActiveRecord::Base
	has_secure_password
	has_many :folders
	has_many :notes
	validates :first_name, :email, :password, presence: true
	validates :email, uniqueness: { case_sensitive: false, 'message' => 'is already taken'}
end
