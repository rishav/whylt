class UserMailer < ActionMailer::Base
 def registration_mail(user)
  recipients user.email
  from "WHYLT Registration Confirmation <noreply@WHYLT.com>"
  subject "Account Registration Succesful"
  sent_on Time.zone.now
  body :user=>user
 end
end
