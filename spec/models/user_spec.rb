require 'rails_helper'
RSpec.describe User, :type => :model do
  before do
    @user = User.create(name: 'abir', email: 'abir@selise.ch', password_digest: 'abir1234')
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
      user = User.new(name: 'abir', email: 'abir1@selise.ch', password_digest: 'abir1234')
      expect(user).to_not be_valid
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
      user = User.new(name: 'abir1', email: 'abir@selise.ch', password_digest: 'abir1234')
      expect(user).to_not be_valid
    end

    it 'is valid when the email follow the syntax/format' do
      expect(@user).to be_valid
    end
    it 'is not valid when the email is not following the format of email' do
      @user.email = 'ww.f.eom'
      expect(@user).to_not be_valid
    end
  end
end
