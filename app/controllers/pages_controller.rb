class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile
  def home
    @items = Item.all
  end

  def profile
  end
  def user_items
  end
end
