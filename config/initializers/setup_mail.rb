ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:domain => "example.com",
:user_name => "join.letstalk@gmail.com",
:password => "talk4356",
:authentication => "plain",
:enable_starttls_auto => true
}
