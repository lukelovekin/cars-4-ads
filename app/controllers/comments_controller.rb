class CommentsController < ApplicationController
before_action :get_comment, only: [:show, :destroy]

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
    @comment.delete
    redirect_to post_path(params[:post_id])
  end

private

    def get_comment
      @comment = Comment.find(params[:comment_id])
    end


end



