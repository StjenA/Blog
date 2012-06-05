class HomeController < ApplicationController
  
  def index
    @username = params[:username]
    @password = params[:password]
  end
  
  def show
    
  end
  
  def destroy
    
  end
  def new_feedback
    @feedback_message = FeedbackMessage.new
  end
end
