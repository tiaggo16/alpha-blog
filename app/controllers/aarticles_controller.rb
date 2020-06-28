class AarticlesController < ApplicationController

  def show
    @aarticle = Aarticle.find(params[:id])
  end

  def index
    @aarticles = Aarticle.all
  end
  
  def new
    @aarticle = Aarticle.new
  end

  def create
    @aarticle = Aarticle.new(params.require(:aarticle).permit(:title, :description))
    if @aarticle.save
      flash[:notice] = "Article was created successfully."
      redirect_to @aarticle      
    else
      render 'new'
    end

  end

end
