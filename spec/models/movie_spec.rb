require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

  context 'valid when all column is assigned' do
    it 'should be valid when all column is assigned' do
      expect(subject).to be_valid
    end
  end

  describe "# not valid when ?" do
    it 'should be not valid when title nil' do
      subject.title = nil
    end

    it 'should be not valid when description nil' do
      subject.description = nil
    end

    it 'should be not valid when rating is less than 0' do
      subject.rating = -0.1
    end

    it 'should be not valid when rating is more than 10' do
      subject.rating = 10.1
    end

    after do
      expect(subject).to_not be_valid
    end
  end
end
