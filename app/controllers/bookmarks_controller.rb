class BookmarksController < ApplicationController
  include Authorization

  before_action :set_t_scope
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:show, :destroy]
  before_action :allow_if_owner!, only: [:show, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.where(owner: current_user)
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
    respond_to do |format|
      format.html { redirect_to poi_path(@bookmark.poi_id) }
      format.json { redirect_to poi_path(@bookmark.poi_id) }
    end
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.owner = current_user

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark.poi }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { redirect_to root_path, alert: t('error', scope: @t_scope) }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @bookmark.poi }
      format.json { head :no_content }
    end
  end

  private
    def set_t_scope
      @t_scope = :bookmarks
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:poi_id)
    end
end
