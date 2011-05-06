require 'development_mail_interceptor'
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "thegoodsamaritan.com",
  :user_name            => "kruttikagarwal@gmail.com",
  :password             => "p@ssw0rd",
  :authentication       => "plain",
  :enable_starttls_auto => true
} if Rails.env.development?

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.sendgrid.net",
  :port           => "25",
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => ENV['SENDGRID_DOMAIN']
  
} if Rails.env.production?

ActionMailer::Base.default_url_options[:host] = "localhost:3000"  if Rails.env.development?
ActionMailer::Base.default_url_options[:host] = "www.thegoodsamaritan.com"  if Rails.env.production?
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
#ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
