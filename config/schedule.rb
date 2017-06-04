every 0.25.minutes do
  runner 'CurrencyLoggingWorker.perform_async'
end
