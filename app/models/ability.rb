class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:read, :create, :update, :destroy], Balance, user: user
  end
end
