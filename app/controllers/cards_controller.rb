class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.save
    #caminho
  end
  
  def edit
  end

  def update
    @card.update(card_params)
    #caminho
  end

  def destroy
    @card.destroy
    #caminho
  end

end

private

def set_card
  @card = Card.find(params[:id])
end

def card_params
  params.require(:card).permit()
end