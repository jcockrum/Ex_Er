class TopicsController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :destory]
  before_filter :correct_topic, :only => [:edit, :update, :destroy]
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end
 
 def create
     @forum = Forum.find(params[:forum_id])
     @topic = @forum.topics.build(params[:topic])
     @topic.user_id = current_user.id
    if @topic.save
      redirect_to @topic, :notice => "Successfully created forum."
    else
      render :action => 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to @topic, :notice  => "Successfully updated forum."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_url, :notice => "Successfully destroyed topic."
  end

private
    def authenticate
      deny_access unless :current_user?
   end
   
   def correct_topic
     @topic = Topic.find_by_id(params[:id])
      redirect_to topics_path, :notice => "Action Failed." unless current_user?(@topic.user)
    end  

end
