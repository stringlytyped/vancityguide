class PoisController < ApplicationController
  include Authorization

  before_action :authenticate_user!, only: [:index, :new, :edit, :create, :update, :destroy]
  before_action :set_poi, only: [:show, :edit, :update, :destroy]
  before_action :allow_if_owner!, only: [:edit, :update, :destroy]

  # GET /pois
  # GET /pois.json
  def index
    @t_scope = [:pois, :index]
    @my_pois = Poi.where(owner: current_user)
    if current_user.admin?
      @other_pois = Poi.where.not(owner: current_user)
    end
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
    unless @poi.public? || @poi.owner == current_user || current_user.admin? 
      deny_access!
    end

    @t_scope = [:pois, :show]
    @title = @poi.name
    
    @bookmark =
      if current_user.present?
        Bookmark.find_by(owner: current_user, poi: @poi)
      else
        nil
      end
  end

  # GET /pois/new
  def new
    @t_scope = [:pois, :new]
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
    @t_scope = [:pois, :edit]
  end

  # POST /pois
  # POST /pois.json
  def create
    @poi = Poi.new(poi_params)
    @poi.owner = current_user

    respond_to do |format|
      if @poi.save
        format.html { redirect_to @poi, notice: t('create_success', scope: :pois) }
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
        format.html { redirect_to @poi, notice: t('update_success', scope: :pois) }
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
      format.html { redirect_to pois_path, notice: t('destroy_success', scope: :pois) }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poi_params
      permitted_params = [:public, :name, :rating, :website, :price, :description, :category, :lat, :lon]

      # Only allow admins to change the featured field
      permitted_params.push :featured if current_user.admin?

      params.require(:poi).permit(permitted_params)
    end
end
