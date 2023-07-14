class LandController < ApplicationController
  def landingpage
    redirect_to articles_path if logged_in?
  end
end
