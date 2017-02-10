class UserMailer < ApplicationMailer
  default from: "noreply@sonntagnacht.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => "noreply@sonntagnacht.com",
        :to => 'gabriella.gricius@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
