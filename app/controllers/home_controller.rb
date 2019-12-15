class HomeController < ApplicationController
  def home
    @user_pois = Poi.where(public: true, featured: false)
  end
end
