# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user = User.new)
    can %i[create read update destroy], Balance, user: { id: user.id }
  end
end
