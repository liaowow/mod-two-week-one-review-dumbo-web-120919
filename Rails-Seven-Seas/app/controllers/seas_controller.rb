class SeasController < ApplicationController
  #define your controller actions here

  #READ
  def index
    @seas = Sea.all
    render :index
  end

  def show
    @sea = Sea.find(params[:id])
    render :show
  end

  #CREATE
  def new
    @sea = Sea.new
    render :new
  end

  def create
    sea = Sea.create(sea_params)
    redirect_to sea_path(sea.id)
  end

  #UPDATE
  def edit
    @sea = Sea.find(params[:id])
    render :edit
  end

  #DELETE
  def destroy
    sea = Sea.find(params[:id])
    sea.destroy

    redirect_to '/seas'
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
