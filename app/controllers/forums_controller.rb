class ForumsController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :destory]
  before_filter :correct_forum, :only => [:edit, :update, :destroy]
  
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find(params[:id])
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(params[:forum])
    @forum.user_id = current_user.id
    if @forum.save
      redirect_to @forum, :notice => "Successfully created forum."
    else
      render :action => 'new'
    end
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      redirect_to @forum, :notice  => "Successfully updated forum."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to forums_url, :notice => "Successfully destroyed forum."
  end

private

    def authenticate
      deny_access unless :current_user?
   end
   
   def correct_forum
     @forum = Forum.find_by_id(params[:id])
      redirect_to root_path , :notice => "Action Failed." unless current_user?(@forum.user)
    end  

end

