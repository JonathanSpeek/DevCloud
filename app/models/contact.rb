# frozen_string_literal: true
# Contact Model for mailer
class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'DevCloud Support',
      to: 'jonspeek@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
