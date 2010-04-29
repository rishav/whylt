class UserObserver < ActiveRecord::Observer
  def after_save(user)
    UserMailer.deliver_registration_mail(user)
  end
end
