class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  # before_action :check_user_profile, except: [:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @user = User.all
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
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.picture.attach(params[:post][:picture])

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
    @post.picture.attach(params[:post][:picture])
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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :price)
    end

        def check_user_profile
        if user_signed_in?
            if !current_user.first_name || !current_user.username || !current_user.suburb || !current_user.state
                redirect_to edit_user_path(current_user)
            end
        end
    end

    def after_sign_in_path_for(resource)
        if user_signed_in?
            if !current_user.first_name || !current_user.username || !current_user.suburb || !current_user.state
               return edit_user_path(current_user)
            else
                return root_path
            end
        end
    end
end