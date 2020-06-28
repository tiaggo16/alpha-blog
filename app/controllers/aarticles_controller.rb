class AarticlesController < ApplicationController

  def show
    @aarticle = Aarticle.find(params[:id])
  end

  def index
    @aarticles = Aarticle.all
  end
  
end
