class OrdersController < ApplicationController
  before_action :set_card, only: :create

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @order = Order.new
    if @card.sold == false
      @card.sell!
      @order.card = @card
      @order.user = current_user
      @order.save
      redirect_to orders_path, notice: "card was successfully bought"
    else
      redirect_to card_path(@card), alert: "card was already sold"
    end
  end

  private

  def set_card
    @card = Card.find(params[:card_id])
  end
end
