class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, [Category, Message]
      can :publish, Category
    elsif user.has_role? :user
      can :manage, [Category, Message], user_id: user.id
    end
    can :read, [Category, Message]
  end

end
