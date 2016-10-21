namespace :card do
  desc 'Assign a card to the current date'
  task assign_date: :environment do
    cards = Card.where(:year => Time.zone.now.year)
    cards = cards.where(:month => Time.zone.now.month)
    cards = cards.where(:day => Time.zone.now.day)
    if cards.empty?
      @card = Card.where(:year => nil).all.order('RANDOM()').first
      @card.year = Time.zone.now.year
      @card.month = Time.zone.now.month
      @card.day = Time.zone.now.day
      @card.save
    end
  end

end
