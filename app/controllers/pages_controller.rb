class PagesController < ApplicationController
  def new
  end
  
  def show
    @page = Page.find_by_id(params[:id])
  end
  
  def create
    @page = Page.create(page_params)
    @user = current_user
    # if @page.valid?
    #       redirect_to user_path(current_user)
    #     else
    #       render user_path(current_user)
    #     end
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
  end
  def edit
    @page = Page.find_by_id(params[:id])
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
    end
  end
  
  def update
    puts "update from controller"
    @page = Page.find_by_id(params[:id])
    @page.update_attributes(page_params)
    respond_to do |format|
      format.html { }
      format.js { p "javscript" }
    end
  end
  
  def destroy
    @page = Page.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js 
    end
    
  end
  
  private
  def page_params
    params.require(:page).permit(:name, :user_id, :timeframe)
  end
  
end
