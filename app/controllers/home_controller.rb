class HomeController < ApplicationController
  def home
    @user_pois = Poi.where(public: true, featured: false).where.not(lat: nil, lon: nil)
  end
end
