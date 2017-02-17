# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("bikes4life@example.com", "Bikes4life", "Your message is very important for us, here some links for you: We <3 Bikes4life!")
  end
end
