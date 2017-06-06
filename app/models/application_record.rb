# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  include Serializable

  self.abstract_class = true
end
