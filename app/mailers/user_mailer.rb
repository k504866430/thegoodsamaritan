class UserMailer < ActionMailer::Base
  default :from => "TheGoodSamaritan"
  
  def invite(mail_data_holder)
    @participation = mail_data_holder[:participation]
    @event = mail_data_holder[:event]
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{@participation.person.first_name} #{@participation.person.last_name} <#{@participation.person.email}>",
         :subject => "Welcome to #{@event.title}", :from => "TappedIIIn")
  end

  def match(mail_data_holder)
    @participation = mail_data_holder[:participation]
    @event = mail_data_holder[:event]
    @people = mail_data_holder[:people]
    mail(:to => "#{@participation.person.first_name} #{@participation.person.last_name} <#{@participation.person.email}>",
         :subject => "TappedIn is here to Energize Your Experience")
  end

end
