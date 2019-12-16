class ApplicationController < ActionController::Base

  before_action :set_featured_pois

  private

    def set_featured_pois
      @featured_pois = Poi.where(featured: true, public: true).where.not(lat: nil, lon: nil)
    end

end
