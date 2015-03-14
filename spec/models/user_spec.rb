require 'spec_helper'

describe User do
  let(:user) { build(:user) }

  context 'associations' do
    it { should have_many(:videos).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:uid) }
  end

  describe '#genarate_token!', slow: true do
    subject { create(:user) }

    it 'should create token' do
      expect { subject.generate_token! }.to change { subject.token }
    end
  end
end
