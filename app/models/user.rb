# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  PASSWORD_FORMAT = /\A(?=.*\d)(?=.*[a-z])/x # password should contain only digits and letters
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6, maximum: 72 }, format: { with: PASSWORD_FORMAT, message: "Password should contain lower case and digits"}
end