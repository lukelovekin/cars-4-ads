class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :drivers, :advertisers]
  

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc).preload(:user)
    # @user = User.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    unless user_signed_in? && current_user.id == @post.user_id 
      redirect_to post_path, notice: "Not yours to edit"
    end 
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.post_pics.attach(params[:post][:post_pics])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.post_pics.attach(params[:post][:post_pics])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

    if @post.destroy 
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  #The Advertisers ads only page
  def advertisers
    @posts = Post.where("car_owner = false")
  end

  #The Drivers ads only page
  def drivers
    @posts = Post.where("car_owner = true")
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :price, :car_owner)
    end
end