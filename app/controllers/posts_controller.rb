class PostsController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :destory]
  before_filter :correct_post, :only => [:edit, :update, :destroy]

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@topic, :notice => 'post was successfully created.') }
      else
        format.html { redirect_to(@topic, :notice => 'topic could not be saved. Please fill in all fields')}
      end
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      #redirect_to( [:topic_id, @post],:notice  => "Successfully updated forum.")
      redirect_to :back, :notice => "Successfully updated forum."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post  = @topic.posts.find(params[:id])
    @post.destroy
    redirect_to topic_url(@topic), :notice => "Successfully destroyed post."
  end
  
private

    def authenticate
      deny_access unless :current_user?
   end
   
   def correct_post
     @post = Post.find_by_id(params[:id])  
     redirect_to topics_path, :notice => "Post Action Failed." unless current_user?(@post.user)
    end  
end
