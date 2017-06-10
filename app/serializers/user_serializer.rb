# frozen_string_literal: true

class UserSerializer < Operators::Serializer
  def as_json
    {
      id: id,
      email: email
    }
  end
end
