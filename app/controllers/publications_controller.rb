class PublicationsController < ApplicationController
  before_action :find_publication, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @publications = Publication.all.order("created_at DESC")
  end

  def show

  end

  def new
    @publication = current_user.publications.build
    @towns = Town.all.map { |c| [c.name, c.id]  }
  end

  def create
    @publication = current_user.publications.build(publication_params)
    @publication.town_id = params[:town_id]

    if @publication.save
      redirect_to "/publications"
    else
      render 'new'
    end
  end

  def edit
    @towns = Town.all.map { |c| [c.name, c.id]  }
  end

  def update
    if @publication.update(publication_params)
      redirect_to publication_path(@publication)
    else
      render 'edit'
    end
  end

  def destroy
    @publication.destroy
    redirect_to publications_path
  end

    def upvote
      @publication.upvote_from current_user
      redirect_to @publication
    end

    def downvote
      @publication.downvote_from current_user
      redirect_to @publication
    end

  private
    def publication_params
      params.require(:publication).permit(:title, :town, :publication_type, :text, :publication_img)
    end

    def find_publication
      @publication = Publication.find(params[:id])
    end
end
