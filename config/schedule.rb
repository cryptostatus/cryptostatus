every 15.seconds do
  runner 'CurrencyLoggingWorker.perform_async'
end
