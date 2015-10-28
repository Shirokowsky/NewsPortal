require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { FactoryGirl.create :article }

  it{ expect(article).to be_valid }
  it 'belongs to user'
  it 'belongs to many categories'
  it 'has many comments'
  it 'can be edit by creator or admin'
  it 'cannot be edited by simple user'
  it 'cannot be destroyed by users'
  it 'can be destroyed by admin'
end
