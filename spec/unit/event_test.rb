require 'rails_helper'
RSpec.describe Event, type: :request do
    subject do
      described_class.new(date: '2022-10-18 03:00:00', location: 'Nam house')
    end
  
  
    it 'is valid with all valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.date = nil
      expect(subject).not_to be_valid
    end
  
    it 'is not valid without an email' do
      subject.location = nil
      expect(subject).not_to be_valid
    end
  end