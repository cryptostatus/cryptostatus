# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :balances, inverse_of: :user, dependent: :destroy
end
