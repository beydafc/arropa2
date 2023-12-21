class MovementsController < ApplicationController
  before_action :set_item, only: %i[show create]
  before_action :authenticate_user!, only: %i[index show create]

  def index
    #@movements = Movement.where(user_id: current_user.id)
    @movements = Movement.all
  end

  def show
    @movement = Movement.find(params[:id])
  end

  def create
    @movement = Movement.create(purchase_date: Date.today, user_id: current_user.id, item_id: params[:item_id])
    sold(@item)
    redirect_to(items_path)
  end

  def sold(item)
    item.update_attribute(:status, "sold")
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
