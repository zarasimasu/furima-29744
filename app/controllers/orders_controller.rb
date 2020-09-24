class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order = Order.new(order_params[:token])
    if @order.valid?
      pay_item

      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :municipality, :building, :tel)
  end

  def pay_item
    Payjp.api_key = "sk_test_2e1eef4ff4bcbee15ab8ac20"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end


end
