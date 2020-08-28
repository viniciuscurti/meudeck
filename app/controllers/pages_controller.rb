class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @last_cards = Card.order(:created_at).last(4)
  end

  def my_profile

  end
end
