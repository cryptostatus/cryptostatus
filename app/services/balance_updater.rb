class BalanceUpdater < Rectify::Command
  def initialize(form, balance, user)
    @form = form
    @balance = balance
    @user = user
  end

  def call
    @balance.update(@form.attributes.merge(user_id: @user.id))
    broadcast :result, @balance
  end
end
