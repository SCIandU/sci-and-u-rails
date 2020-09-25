class BasicPagesController < ApplicationController
  
  skip_before_action :authenticate_user!, raise: false, :only => :show, :if => lambda { 
    if params[:id]
      @page = BasicPage.find(params[:id])
      @page and (@page.id == 29 or @page.id > 32)
    else
      false
    end
  }  

  def new
    @page = BasicPage.new
  end

  def index
    @pages = BasicPage.all
  end

  def show
    if params[:id] == "29" or params[:id] > "32" 
  	 @portalflag = true
    else
     @portalflag = false 
    end
    @page = BasicPage.find(params[:id])
  end
end
