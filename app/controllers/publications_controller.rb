class PublicationsController < ApplicationController
  before_action :find_publication, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:town].blank?
      @publications = Publication.all.order("created_at DESC")
    else
      @town_id = Town.find_by(name: params[:town]).id
      @publications = Publication.where(:town_id => @town_id).order("created_at DESC")
    end
  end

  def show
    if @publication.comments.blank?
      @average_publication = 0
    else
      @average_publication = @publication.comments.average(:rating).round(2)
    end
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

  # Add and remove favorite recipes
  # for current_user
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @publication
      redirect_to :back, notice: 'You favorited #{@publication.name}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@publication)
      redirect_to :back, notice: 'Unfavorited #{@publication.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end



  private
    def publication_params
      params.require(:publication).permit(:title, :town, :publication_type, :text, :publication_img)
    end

    def find_publication
      @publication = Publication.find(params[:id])
    end
end
