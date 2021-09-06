class PostsController < ApplicationController
  before_action :set_topic 
  before_action :set_post, only: %i[ show edit update destroy ]
 

  # GET /posts or /posts.json
  def index
    @posts = Post.where("topic_id = ?", params[:topic_id])
  end

  # GET /posts/1 or /posts/1.json
  def show
    
    @comments =Comment.where("post_id = ?", params[:id])
    @post = Post.find(params[:id])
    @tags = @post.tags

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  def new
    puts @post
    @post = Post.new
    @tags=Tag.all
    
  end

  # GET /posts/1/edit
  def edit
    @tags=Tag.all
  end

  # POST /posts or /posts.json
  def create
    @post = Post.create(post_params)
    @post.topic_id=@topic.id
    
    
    
    p (params[:tags]),"################################"
    

    respond_to do |format|
      if @post

       @checkTag = Tag.create(post_params_tags)
       Taglink.create(post_id:@post.id,tag_id:@checkTag.id)

        format.html { redirect_to topic_posts_url(@post.topic_id), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to  topic_posts_url(@post.topic_id), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url(@post.topic_id), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic=Topic.find(params[:topic_id])
    end

    def set_post
      
      @post = @topic.posts.find(params[:id])
      p @post,@topic,
      '*********************'

    end
    

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :desc, :topic_id)
    end
    def post_params_tags
      params.require(:post).permit(:tag_name)
    end
end
