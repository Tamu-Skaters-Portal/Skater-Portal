require 'rails_helper'

RSpec.describe Member, type: :model do
  subject do
    described_class.new(name: 'Nam Cao', email: 'email@email.com', points: 2, paid_status: true, permission_id: 1)
  end


  it 'is valid with all valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a member' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without points' do
    subject.points = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without paid_status' do
    subject.paid_status = nil
    expect(subject).not_to eq(false)
  end

  it 'is not valid without a valid permission' do
    subject.permission_id = nil
    expect(subject).not_to be_valid
  end
end
