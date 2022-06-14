# frozen_string_literal: true

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
require 'rails_helper'
RSpec.describe User, type: :model do
  # let (:user) { User.create(name: 'abir', email: 'abir1@selise.ch', password: 'abir1234', password_confirmation: 'abir1234') }
  before do
    @user = User.create(name: 'abir', email: 'abir@selise.ch', password: 'abir1234', password_confirmation: 'abir1234')
  end
  describe 'name validations' do
    it 'is valid with the present of name' do
      expect(@user).to be_valid
    end
    it 'is not valid with the absent of name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is valid with unique name' do
      expect(@user).to be_valid
    end
    it 'is not valid with duplicate name' do
      user_1 = User.new(name: 'abir', email: 'abir1@selise.ch', password: 'abir1234', password_confirmation: 'abir1234')
      expect(user_1).to_not be_valid
    end
  end

  describe 'email validations' do
    it 'is valid with the presence of email' do
      expect(@user).to be_valid
    end
    it 'is not valid with the absence of the email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is valid when the email is unique' do
      expect(@user).to be_valid
    end
    it 'is not valid when the email is duplicate' do
      user_1 = User.new(name: 'abir1', email: 'abir@selise.ch', password: 'abir1234', password_confirmation: 'abir1234')
      expect(user_1).to_not be_valid
    end

    it 'is valid when the email follow the syntax/format' do
      expect(@user).to be_valid
    end
    it 'is not valid when the email is not following the format of email' do
      @user.email = 'ww.f.eom'
      expect(@user).to_not be_valid
    end
  end

  describe 'Password validation' do
    it 'is valid with valid password' do
      expect(@user).to be_valid
    end
    it 'is not valid with invalid password' do
      @user.password = '1234abir'
      @user.password_confirmation = '1234abir'
      expect(@user).to be_valid
    end

    it 'is valid with same password and confirmation password' do
      @user.password = '1234abir'
      @user.password_confirmation = '1234abir'
      expect(@user).to be_valid
    end
    it 'is not valid with different password and confirmation password' do
      @user.password = '1234abir'
      @user.password_confirmation = 'abir1234'
      expect(@user).to_not be_valid
    end

    it 'is valid when the password is present' do
      @user.password = '1234abir'
      @user.password_confirmation = '1234abir'
      expect(@user).to be_valid
    end
    it 'is not invalid when the password is absent' do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it 'is valid when the password has healthy length' do
      @user.password = 'a1' * 3
      @user.password_confirmation = 'a1' * 3
      expect(@user).to be_valid
      @user.password = 'a1' * 36
      @user.password_confirmation = 'a1' * 36
      expect(@user).to be_valid
    end
    it 'is not valid when the password length is small' do
      @user.password = 'a' * 5
      expect(@user).to_not be_valid
    end
    it 'is not valid when the password length is too big' do
      @user.password = 'a' * 73
      expect(@user).to_not be_valid
    end
  end
end
