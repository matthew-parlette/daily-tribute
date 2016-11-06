class CardsController < ApplicationController
  before_action :authenticate_user!

  def index
    case Role.find(current_user.role).name
      when 'Admin'
        @cards = Card.all
      when 'Contributor'
        @cards = Card.where(source: current_user.id)
        render 'admin'
      when 'Target'
        render 'admin'
    end
  end

  def create
    @card = Card.new(card_params)

    if !@card.save
      render 'new'
    end

    if params[:card].key?('media')
      uploaded_io = params[:card][:media]
      # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      File.open(Rails.root.join('public', @card.id.to_s + '.jpg'), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end

    redirect_to card_url(@card)
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
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
    @card = Card.find(params[:id])

    if params[:card].key?('media')
      uploaded_io = params[:card][:media]
      # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      File.open(Rails.root.join('public', @card.id.to_s + '.jpg'), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end

    if @card.update(card_params)
      redirect_to card_url(@card)
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_url
  end

  def admin
    @cards = Card.all
  end

  private
    def card_params
      params.require(:card).permit(
          :title, :description, :source, :era
      )
    end
end
