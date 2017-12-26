class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, Folder, user_id: user.id
      can :manage, Note, user_id: user.id
      can :manage, Upload, user_id: user.id
    end
  end
end
