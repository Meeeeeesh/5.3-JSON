class PalettesController < ApplicationController

  def index
    @palettes = Palette.all
      render json: Palette.all
    end
  end

  def show
    @palette = get_palette
      render :get_palette
    end

  def create
    @palette = Palette.new(palette_params)
      if @palette.save
        render status: :created 
      else
        render status: :unprocessable_entity
      end
    end

  def update
    @palette = get_palette
      if @palette.update(palette_params)
        head :no_content
      else
        render status: :unprocessable_entity
      end
    end

  def destroy
    @palette = get_palette
      if @palette.destroy
        head :no_content
      else
        render status: :unprocessable_entity 
      end
    end

  private

  def get_palette
    Palette.find(params[:id])
  end

  def palette_params
    params.require(:palette).permit(:name, :dom_one, :dom_two, :sec_one, :sec_two, :pop)
  end