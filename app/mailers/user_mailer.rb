class UserMailer < ApplicationMailer
  default from: 'sciandustudy@utoronto.ca'
 
  def welcome(params)
    @url  = 'https://sci-and-u.ca/'
    @first_name = params.first_name
    @last_name = params.last_name    
    @email = params.email        
    mail(to: @email, from: 'sciandustudy@utoronto.ca', subject: 'Welcome to SCI & U')
  end	
end
