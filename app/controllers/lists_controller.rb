class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  def index
    @list = List.all.order("created_at asc")
    @barber = Barber.all.order("created_at desc")
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new list_params

    if @list.save
      redirect_to root_path, notice: "#{@list.name}, You have been added to the List!"
    else
      render 'new', notice: "Oh No! Not Saved!"
    end
  end

  def show

  end

  def edit

  end

  def update
    if @list.update list_params
      redirect_to @list, notice: "#{@list.name}, has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path, notice: "#{@list.name}, has been deleted!"
  end

  private

  def list_params
    params.require(:list).permit(:name, :barber_id)
  end

  def find_list
    @list = List.find(params[:id])
  end

end
