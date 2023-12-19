class MovementsController < ApplicationController
  before_action :set_item, only: %i[create new]

  def index
    @movements = Movement.where(user_id: current_user.id)
  end

  def show
    @movement = Movement.find(params[:id])
  end

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.create(item_id: @item.id, user_id: current_user.id, purchase_date: Date.today)
    # Puedo añadir un if aunque no hay lugar a inputs del usuario
    redirect_to(items_path)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
