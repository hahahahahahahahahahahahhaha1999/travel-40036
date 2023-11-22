class TravelsController < ApplicationController

  def new 
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to prefecture_path(@travel.prefecture), notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    @travel = Travel.find(params[:id])
    if @travel.update(travel_params)
      redirect_to prefecture_path(@travel.prefecture), notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    travel = Travel.find(params[:id])
    travel.destroy
  end

  private

  def travel_params
    params.require(:travel).permit(:title, :image, :check_in, :check_out, :partner_id, :price, :travel_site_id, :content, :prefecture_id).merge(user_id: current_user.id)
  end
end
