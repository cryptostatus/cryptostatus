# frozen_string_literal: true

class BalanceUpdater < Rectify::Command
  def initialize(form, balance, user)
    @form    = form
    @balance = balance
    @user    = user
  end

  def call
    return broadcast :result, @form unless @form.valid?

    @balance.update(
      @form.attributes.merge(
        user: @user
      )
    )

    broadcast :result, @balance
  end
end
