require 'spec_helper'

describe PageDetail do
  let(:page) { FactoryGirl.create(:page) }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(id: page.friendly_id)) }

  subject { described_class.build(controller) }

  describe '#title' do
    it 'is the record title' do
      expect(subject.title).to be == page.title
    end
  end

  describe '#body' do
    it 'formats the page body' do
      expect(MarkDownConverter).to receive(:call).with(page.body)
      subject.body
    end
  end
end