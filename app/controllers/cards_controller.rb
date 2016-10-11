class CardsController < ApplicationController
  def index
  end

  def create
    @card = Card.new(params.require(:card).permit(
        :title, :description
    ))

    @card.save
    redirect_to cards_admin_url
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def admin
    @cards = Card.all
  end
end
