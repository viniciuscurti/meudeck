class OrdersController < ApplicationController
  before_action :set_card, only: :create

  def index
    @orders = Order.where(current_user)
  end

  def create
    @order = Order.new(order_params)
    @order.card = @card
    @order.user = current_user
    @order.save

    redirect_to orders_path
  end

  private

  def set_card
    @card = Card.find(params[:card_id])
  end

  def order_params
    params.require(:order).permit(:price)
  end
end
