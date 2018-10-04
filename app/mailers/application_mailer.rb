class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@pda.com"
  layout 'mailer'
end
