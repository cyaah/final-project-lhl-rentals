class ProfilesController < ApplicationController
  def show
    @profile = Profiles.find(params[:id])
  
  end
end
