class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile
  def home
    @items = Item.all
  end

  def profile
  end

  def user_items
    @items = Item.where(user_id: current_user.id, status: "sale")
  end
end
