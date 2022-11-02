require 'rails_helper'

RSpec.describe Member, type: :model do
  subject do
    described_class.new(name: 'Nam Cao', email: 'email@email.com', access_type: 1, paid_status: 25, points: 2)
  end


  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end


  it 'is not valid without access type' do
    subject.access_type = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without paid status' do
    subject.paid_status = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a valid points' do
    subject.points = nil
    expect(subject).not_to be_valid
  end
end


