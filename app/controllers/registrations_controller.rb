# This will override the super Class for Devise, sending an email to the admin on new user creation
class RegistrationsController < Devise::RegistrationsController

  def create
    super
    NewUserMailer.new_user_email(resource).deliver_now unless resource.invalid?
  end
end
