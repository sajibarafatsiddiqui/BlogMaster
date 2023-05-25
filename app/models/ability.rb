class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Post
    can :read, Comment

    if user.is? :admin
      can :manage, :all
    else
      can :create, Post
      can :update, Post, author_id: user.id
      can :destroy, Post, author_id: user.id
      can :create, Comment
      can :update, Comment, author_id: user.id
      can :destroy, Comment, author_id: user.id
    end
  end
end
