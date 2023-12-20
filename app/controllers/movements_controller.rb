class MovementsController < ApplicationController
  before_action :set_item, only: %i[show]
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
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
