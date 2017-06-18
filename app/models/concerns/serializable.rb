# frozen_string_literal: true

module Serializable
  extend ActiveSupport::Concern

  included do
    def as_json(*)
      "#{self.class}Serializer".constantize.new(self)
    end
  end
end
