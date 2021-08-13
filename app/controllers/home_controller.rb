class HomeController < ApplicationController

  skip_before_filter :ensure_user_logged_in
  
  def index
    if current_user
      redirect_to folders_url
    end
  end
end
