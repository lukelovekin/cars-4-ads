class CommentsController < ApplicationController
  before_action :get_comment, only: [:show]


  def create
    @comment = Comment.new(comment_params)

    @comment.post = Post.find(params[:post_id])
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(params[:post_id])
  end

  def show
    # @comment = Comment.find(params[:comment_id])
  end

  def update
  end

  def destroy
      @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
end

private

def comment_params
  params.require(:comment).permit(:body)
end

def get_comment
  @comment = Comment.find(params[:comment_id])
end

