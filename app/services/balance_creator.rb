# frozen_string_literal: true

class BalanceCreator < Rectify::Command
  def initialize(form, user)
    @form = form
    @user = user
  end

  def call
    return broadcast :result, @form unless @form.valid?

    balance = Balance.create(
      @form.attributes.merge(
        user: @user
      )
    )

    broadcast :result, balance
  end
end
