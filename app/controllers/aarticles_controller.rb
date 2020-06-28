class AarticlesController < ApplicationController

  def show
          @aarticle = Aarticle.find(params[:id])
  end

end
