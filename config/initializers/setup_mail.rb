ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = { 
    :address                =>  'smtp.sendgrid.net',
    :port                   =>  '587',
    :authentication         => :plain,
    :user_name              => 'app36617907@heroku.com',
    :password               => 'qktin4hc4566',
    :domain                 => 'heroku.com',
    :enable_starttls_auto   =>  true
 
}

