
ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => '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',
    :domain => 'test@example.com',
    :address => 'smtp.sendgrid.net',
    :port => '2525',
    :authentication => :plain,
    :enable_starttls_auto => true
}