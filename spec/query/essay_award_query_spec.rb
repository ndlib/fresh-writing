require 'spec_helper'

describe EssayAwardQuery do
  subject { described_class }
  let(:essay_award) { FactoryGirl.create(:essay_award) }

  describe '#all' do
    it 'returns all essay awards' do
      FactoryGirl.create_list(:essay_award, 2)
      expect(subject.all.count).to be == 2
    end

    it "orders by title" do
      # this is not the way I want to test this but the pattern that we have set out does not allow
      # expect(subject.relation).to receive(:order).with(:title) to work
      # I am not certain exactly why but it might have to do with the way that EssayStyleQuery#relation is defined.
      FactoryGirl.create_list(:essay_award, 2)
      expect(subject.all).to eq( EssayAward.all.order(:title))
    end
  end


  describe '#find' do
    it "returns the requested record by friendly id" do
      expect(subject.find(essay_award.friendly_id)).to eq(essay_award)
    end


    it "raises an error when the record doesn't exist" do
      expect{ subject.find('fake')}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
