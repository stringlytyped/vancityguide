class PoisController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_poi, only: [:show, :edit, :update, :destroy]
  before_action :allow_if_owner!, only: [:edit, :update, :destroy]

  # GET /pois
  # GET /pois.json
  def index
    @pois = Poi.all
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  # POST /pois.json
  def create
    @poi = Poi.new(poi_params)
    @poi.owner = current_user

    respond_to do |format|
      if @poi.save
        format.html { redirect_to @poi, notice: 'Attraction was created successfully' }
        format.json { render :show, status: :created, location: @poi }
      else
        format.html { render :new }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pois/1
  # PATCH/PUT /pois/1.json
  def update
    respond_to do |format|
      if @poi.update(poi_params)
        format.html { redirect_to @poi, notice: 'Attraction was updated successfully' }
        format.json { render :show, status: :ok, location: @poi }
      else
        format.html { render :edit }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @poi.destroy
    respond_to do |format|
      format.html { redirect_to pois_url, notice: 'Attraction was deleted successfully' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
    end

    # Disallow action if the current user is not the owner of the POI or admin
    def allow_if_owner!
      unless @poi.owner == current_user || current_user.admin?
        respond_to do |format|
          format.html { redirect_to @poi, alert: 'You don\'t have permission to do that' }
          format.json { head :no_content, status: :unauthorized }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poi_params
      permitted_params = [:public, :name, :rating, :website, :price, :description, :category]

      # Only allow admins to change the featured field
      permitted_params.push :featured if current_user.admin?

      params.require(:poi).permit(permitted_params)
    end
end
