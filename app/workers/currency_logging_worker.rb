class CurrencyLoggingWorker
  include Sidekiq::Worker

  def perform
    CurrencyTracker.new.call

    currency = Currency.last_by_time
    Balance.profitable(currency.price).notifiable.each do |balance|
      File.open('notifcations.txt', 'a+') do |f|
        entry = balance.user.email
        f.write(entry + "\n")
        balance.notify!
      end
    end
  end
end
