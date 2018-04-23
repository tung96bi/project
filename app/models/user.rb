class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  enum gender: [:male, :female]

  validates :email, presence: true, length: {maximum: Settings.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.min_pass}
  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :birthday, presence: true
  validates :gender, inclusion: {in: genders}

  before_save :email_downcase

  has_secure_password

  private
  def email_downcase
    email.downcase!
  end
end
