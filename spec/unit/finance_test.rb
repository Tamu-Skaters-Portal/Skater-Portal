require 'rails_helper'
RSpec.describe(Attendance, type: :model) do
     subject do
     end

     it 'is valid with all valid attributes' do
          expect(subject).to(be_valid)
     end

     it 'is not valid without a name' do
          subject.member_id = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without an email' do
          subject.event_id = nil
          expect(subject).not_to(be_valid)
     end
end
