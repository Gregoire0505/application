class CommentsController < ApplicationController
before_action :find_book
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
  end


  private
    def  comment_params
      params.require(:comment).permit(:rating, :commentaire)
    end

    def find_publication
      @publication = Publication.find(params[:publication_id])
    end

end
