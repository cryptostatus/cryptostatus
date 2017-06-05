class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:index, :create, :update, :destroy], Balance, user: user
  end
end
