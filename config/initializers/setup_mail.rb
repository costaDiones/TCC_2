ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.gmail.com',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'costadiones@gmail.com',
  :password             =>  'Di04061993',
  :domain               =>  'gmail.com',
  :enable_starttls_auto  =>  true
}
