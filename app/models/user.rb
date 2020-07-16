class User < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :orders, through: :cart
  has_many :book_tables

  has_secure_password
  NAME_FORMAT = /\A(?=.* )[^0-9`!@#\\\$%\^&*\;+_=]{4,}/x
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = 	/\A[\w+\-,]+@[a-z\d\-,]+\.[a-z]+\z/i
  PASSWORD_FORMAT = /\A
  (?=.{6,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  /x
  validates :password, format: { with: PASSWORD_FORMAT , message: "must contain a lower case character,a digit with minimum 6 characters."}
  validates :Username, presence: true, format: { with: NAME_FORMAT, message: "must contain characters with minimum of 3 letters"}
  validates :Username, :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
 
end

