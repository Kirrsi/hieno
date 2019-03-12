class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: "contact@example.com"
         to: 'trospe@gmx.de',
         subject: "A new contact form message from #{name}")
  end
end
