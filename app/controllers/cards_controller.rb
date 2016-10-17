class CardsController < ApplicationController
  def index
  end

  def create
    @card = Card.new(params.require(:card).permit(
        :title, :description
    ))

    @card.save

    uploaded_io = params[:card][:media]
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    File.open(Rails.root.join('public', @card.id.to_s + '.jpg'), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    redirect_to cards_admin_url
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def show
    @card = Card.find(params[:id])
  end

  def update
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_admin_url
  end

  def admin
    @cards = Card.all
  end
end
