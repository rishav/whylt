class UserObserver < ActiveRecord::Observer
  def after_save(user)
    user.deliver_registration_mail(self)
  end
end
