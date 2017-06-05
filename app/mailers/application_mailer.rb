# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@cryptostat.us'

  layout 'mailer'
end
