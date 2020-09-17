class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    # redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
