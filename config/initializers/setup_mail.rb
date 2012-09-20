ActionMailer::Base.smtp_settings = {
  :address              => "smtp.1und1.de",
  :port                 => 587,
  :domain               => "tipp2.net",
  :user_name            => "tipp2@tipp2.net",
  :password             => "rnr22678",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "tipp2.net"
require 'development_mail_interceptor' 
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?