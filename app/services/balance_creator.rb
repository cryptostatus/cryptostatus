class BalanceCreator < Rectify::Command
  def initialize(form, user)
    @form = form
    @user = user
  end

  def call
    balance = Balance.create(@form.attributes.merge(user_id: @user.id))
    broadcast :result, balance
  end
end
