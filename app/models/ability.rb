class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, [Category, Message]
    elsif user.has_role? :user
      can :manage, [Category, Message], user_id: user.id
      cannot :publish, Category
    end
    can :read, [Category, Message]
  end

end
