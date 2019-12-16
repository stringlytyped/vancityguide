class HomeController < ApplicationController
  def home
    @t_scope = :home
    @user_pois = Poi.where(public: true, featured: false).where.not(lat: nil, lon: nil)
  end
end
