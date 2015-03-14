require 'spec_helper'

describe Video do
  let(:video) { build(:video) }

  context 'associations' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:video) }
    it { should validate_presence_of(:user_id) }
  end

  describe '#as_json' do
    let(:overwrite) { Hash.new }
    subject { video.as_json(overwrite) }

    it 'has all keys' do
      expect(subject.keys).to include(*%w(id name url))
    end
  end

  describe '#url' do
    it { expect(subject.url).to eq(subject.video.url) }
  end
end
