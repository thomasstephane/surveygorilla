class User < ActiveRecord::Base
  has_many :surveys
  has_many :surveys, through: :participations
  has_many :responses
  has_many :participations

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end