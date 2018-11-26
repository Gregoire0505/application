class CommentsController < ApplicationController
before_action :find_publication
before_action :find_comment, only: [:edit, :update, :destroy]
before_action :find_user, only: [:upvote, :downvote]
before_action :authenticate_user!, only: [:new, :edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.publication_id = @publication.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to publication_path(@publication)
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to publication_path(@publication)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to publication_path(@publication)
  end


  def upvote
    @comment.upvote_from current_user
    redirect_to @publication
  end

  def downvote
    @comment.downvote_from current_user
    redirect_to @publication
  end


  private
    def  comment_params
      params.require(:comment).permit(:rating, :commentaire)
    end

    def find_publication
      @publication = Publication.find(params[:publication_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def find_user
      @comment.publication_id = @publication.id
      @comment.user_id = current_user.id
    end

end
