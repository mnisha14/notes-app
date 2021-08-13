class Note < ActiveRecord::Base
  belongs_to :folder
  belongs_to :user

  def self.of_loggedin_user(user)
    Note.where(user_id: user.id)
  end

end
