class ContactMailer < ApplicationMailer
  default to: 'prgeilpr@gmail.com'

  def send_email(contact)
    @contact = contact
    mail(subject: 'お問い合わせを承りました')
  end
end
