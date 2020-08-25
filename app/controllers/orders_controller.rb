class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    #caminho
  end

  def edit
  end

  def update
    @order.update(order_params)
    #caminho
  end

  def destroy
    @order.destroy
    #caminho
  end

end

private

def set_order
  @card = Card.find(params[:id])
end

def order_params
  params.require(:order).permit()
end

end
