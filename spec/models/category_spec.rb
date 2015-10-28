require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryGirl.create :category}

  it{ expect(category).to be_valid }
  it 'has unique title'
  it 'can be created by admin'
  it 'cannot be created by simple user'
  it 'has many articles'
end
