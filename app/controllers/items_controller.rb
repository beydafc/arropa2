class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy]
  def index
    @items = Item.all
    if params[:query].present?
      @items = Item.search_by_attribute(params[:query])
    end
  end
  
  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:price, :size, :genre, :color, :status, :type, :name, :photo)
  end
end
