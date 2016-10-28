class CardsController < ApplicationController
  def index
  end

  def create
    @card = Card.new(params.require(:card).permit(
        :title, :description, :source, :era
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

  def date
    @card = Card.where(:year => params[:year])
    @card = @card.where(:month => params[:month])
    @card = @card.where(:day => params[:day])
    if @card.length == 1
      @card = @card.first
    else
      render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
    end
  end

  def today
    @card = Card.where(:year => Time.zone.today.year)
    @card = @card.where(:month => Time.zone.today.month)
    @card = @card.where(:day => Time.zone.today.day)
    if @card.length == 1
      @card = @card.first
    else
      render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
    end
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
