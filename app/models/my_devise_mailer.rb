class MyDeviseMailer < Devise::Mailer

  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opts={})

    if record.email.present?
      opts[:subject] = "Welcome #{record.email.split('@').first.capitalize}, Confirm your SCI&U account"
    else
      opts[:subject] = "Confirm Your SCI&U Account"
    end

    super

  end

end