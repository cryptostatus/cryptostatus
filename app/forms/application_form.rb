# frozen_string_literal: true

class ApplicationForm < Rectify::Form
  def initialize(*arguments)
    super; after_initialize
  end
end
