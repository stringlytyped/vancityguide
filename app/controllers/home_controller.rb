##
# Actions for the rendering of the home page
class HomeController < ApplicationController

  ##
  # Show the home page
  # GET /
  def home
    @t_scope = :home
    @user_pois = Poi.where(public: true, featured: false).where.not(lat: nil, lon: nil)
  end

end
