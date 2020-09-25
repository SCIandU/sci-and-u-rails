class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attributes :department
  attributes :type,  validate: ["Email", "Phone", "NA"]
  attributes :time,  validate: ["AM", "PM", "NA"]
  attributes :day, validate: ["Weekday", "Weekend", "NA"]
  attributes :phone
  attributes :street1
  attributes :street2
  attributes :city  
  attributes :province  
  attributes :postalcode    
  attributes :form_type

  attribute :message
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "SCI&U Form Submission: #{form_type}",
      to: "sciandustudy@utoronto.ca",
      from: %("#{name}" <#{email}>)
    }
  end

end
