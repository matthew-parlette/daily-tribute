class CardMailer < ApplicationMailer
  default from: 'matthew.parlette@gmail.com'

  def daily
    @card = Card.where(:year => Time.zone.today.year)
    @card = @card.where(:month => Time.zone.today.month)
    @card = @card.where(:day => Time.zone.today.day)
    if @card.length == 1
      @card = @card.first
    else
      render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
      @card = nil
    end
    attachments.inline["#{Time.zone.today.year}-#{Time.zone.today.month}-#{Time.zone.today.day}.jpg"] = File.read(Rails.root.join('public', "#{@card.id}.jpg"))
    mail(:to => ENV['recipient'], :subject => "Card for #{Time.zone.today.year}-#{Time.zone.today.month}-#{Time.zone.today.day}")
  end
end
