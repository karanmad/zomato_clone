class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = 	/\A[\w+\-,]+@[a-z\d\-,]+\.[a-z]+\z/i
  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
  /x
  validates :password, format: { with: PASSWORD_FORMAT , message: "must contain a upper case, a lower case character,a digit and a symbol with minimum 8 characters"}
  validates :Username, format: { with: /\A[a-zA-Z0-9]+\Z/ , message: "is not valid"}
  validates :Username, :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
end

