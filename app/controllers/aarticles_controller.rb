class AarticlesController < ApplicationController
  before_action :set_aarticle, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
 
  def show
  end

  def index
    @aarticles = Aarticle.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @aarticle = Aarticle.new
  end

  def create
    @aarticle = Aarticle.new(aarticle_params)
    @aarticle.user = current_user
    if @aarticle.save
      flash[:notice] = "Article was created successfully."
      redirect_to @aarticle      
    else
      render 'new'
    end
  end

  def edit  
  end

  def update
    if @aarticle.update(aarticle_params)
      flash[:notice] = "Article was updated successfullly."
      redirect_to @aarticle
    else
      render 'edit'
    end
  end

  def destroy
    @aarticle.destroy
    redirect_to aarticles_path
  end

  private

  def set_aarticle
    @aarticle = Aarticle.find(params[:id])
  end

  def aarticle_params
    params.require(:aarticle).permit(:title, :description)
  end

  def require_same_user
    if current_user != @aarticle.user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @aarticle
    end
  end
 
end
