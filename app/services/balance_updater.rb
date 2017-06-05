class BalanceUpdater < Rectify::Command
  def initialize(form, balance)
    @form = form
    @balance = balance
  end

  def call
    @balance.update(@form.attributes.delete_if { |k, val| val.blank? })
    broadcast :result, @balance
  end
end
