class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save

    if @flat.save
      redirect_to flat_path(@flat)
    else
      p @flat.errors.full_messages
      render :new
    end
  end

  def show

  end

  def edit

  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description)
  end
end
