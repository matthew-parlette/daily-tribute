# Preview all emails at http://localhost:3000/rails/mailers/card_mailer
class CardMailerPreview < ActionMailer::Preview
  def daily
    CardMailer.daily do |email|
      Premailer::Rails::Hook.delivering_email(email)
    end
  end
end
