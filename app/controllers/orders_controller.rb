class OrdersController < ApplicationController
  before_action :set_card, only: :create

  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    card = Card.find(params[:card_id])
    order = Order.create!(card: card, card_sku: card.sku, amount: card.price, state: 'pending', user: current_user)
    card.sell!
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: card.sku,
        images: [card.photo.key],
        amount: card.price_cents * 100,
        currency: 'brl',
        quantity: 1
      }],
      success_url: "https://meudeck.herokuapp.com/orders/#{order.id}",
      cancel_url: "https://meudeck.herokuapp.com/orders/#{order.id}"
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  private

  def set_card
    @card = Card.find(params[:card_id])
  end
end
