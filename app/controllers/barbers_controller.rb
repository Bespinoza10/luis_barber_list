class BarbersController < ApplicationController
  before_action :find_barber, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @barber = Barber.all.order("created_at desc")
  end

  def new
    @barber = Barber.new
  end

  def create
    @barber = Barber.new barber_params

    if @barber.save
      redirect_to @barber, notice: "#{@barber.name} has been saved!"
    else
      render 'new', notice: "Oh No!#{@barber.name} couldn't save!"
    end
  end

  def show
    
  end

  def edit

  end

  def update
    if @barber.update barber_params
      redirect_to @barber, notice: "#{@barber.name} has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @barber.destroy
    redirect_to barbers_path
  end

  private

  def barber_params
    params.require(:barber).permit(:name, :barber_id)
  end

  def find_barber
    @barber = Barber.find(params[:id])
  end

end
