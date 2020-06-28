class AarticlesController < ApplicationController

  def show
    @aarticle = Aarticle.find(params[:id])
  end

  def index
    @aarticles = Aarticle.all
  end
  
  def new

  end

  def create
    @aarticle = Aarticle.new(params.require(:aarticle).permit(:title, :description))
    @aarticle.save
    redirect_to @aarticle
  end

end
