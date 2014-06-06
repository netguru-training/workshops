require 'spec_helper'

describe ReviewDecorator do

  let(:user) { build(:user, firstname: 'John', lastname: 'Doe') }
  let(:review) { described_class.new(build(:review, user: user)) }

  describe '#author' do
    it 'displays review author fullname' do
      expect(review.author).to eq 'John Doe'
    end
  end
end
