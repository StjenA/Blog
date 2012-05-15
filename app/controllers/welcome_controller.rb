class WelcomeController < ApplicationController
  
  def index
    @username = params[:username]
    @password = params[:password]
  end
  
  def show
    
  end
  
  def destroy
    
  end
  
end
