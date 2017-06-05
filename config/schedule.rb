every 1.minutes do
  runner 'CurrencyLoggingWorker.perform_async'
end
