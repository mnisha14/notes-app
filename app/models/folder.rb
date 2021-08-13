class Folder < ActiveRecord::Base
	#NOTES_LIMIT = 5
	attr_accessible :title
	validates :title, 
			  #:presence => true,
			  :length => { minimum: 3, maximum: 15 },
			  :format => { :with => /\A[a-zA-Z0-9]+\z/, 'message' => 'must be only Alphanumeric'}

	has_many :notes, :dependent => :destroy
	belongs_to :user

	def self.of_loggedin_user(user)
		Folder.where(user_id: user.id)
	end
end

# relationship
# folder 1 - * notes


# model validations
# name - present
# name - no special characters - accept only aphanumeric character
# name - min 3, max 15 character


# later
# max 5 notes in a folder