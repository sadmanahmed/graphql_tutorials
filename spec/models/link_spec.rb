require 'rails_helper'

RSpec.describe Link, :type => :model do
  before do
    @link =  Link.create(url: 'https://stackoverflow.com/', description: 'Unique url')
  end
  describe 'url validations' do
    it "is valid with valid url" do
      expect(@link).to be_valid
    end
    it "is not valid without a valid url" do
      @link.url = 'wew.home.com'
      expect(@link).to_not be_valid
    end

    it "is valid with unique url" do
      link = Link.new(url: 'https://facebook.com/', description: 'Unique url')
      expect(link).to be_valid
    end
    it "is not valid without a unique url" do
      link = Link.new(url: 'https://stackoverflow.com/', description: 'not Unique url')
      expect(link).to_not be_valid
    end

    it "is valid with the presence of an url" do
      expect(@link).to be_valid
    end
    it "is not valid without an url" do
      @link.url = nil
      expect(@link).to_not be_valid
    end
  end

  describe 'description validations' do
    it "is valid with the presence of the description" do
      expect(@link).to be_valid
    end
    it "is not valid without the description" do
      @link.description = nil
      expect(@link).to_not be_valid
    end

    it 'is valid when minimum length is 5' do
      expect(@link).to be_valid
    end
    it 'is not valid when minimum length is less than 5' do
      @link.description = 'val'
      expect(@link).to_not be_valid
    end
    it 'is valid when max length is 500' do
      @link.description = 'v' * 500
      expect(@link).to be_valid
    end
    it 'is not valid when maximum length is higher than 500' do
      @link.description = 'v' * 501
      expect(@link).to_not be_valid
    end
  end

end