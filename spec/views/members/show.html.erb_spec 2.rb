require 'rails_helper'

RSpec.describe('members/show', type: :view) do
     before do
          @member = assign(:member, Member.create!(
                                         name: 'Name',
                                         email: 'Email',
                                         token: 'Token',
                                         access_type: 2,
                                         paid_status: 3,
                                         points: 4
                                    )
          )
     end

     it 'renders attributes in <p>' do
          render
          expect(rendered).to(match(/Name/))
          expect(rendered).to(match(/Email/))
          expect(rendered).to(match(/Token/))
          expect(rendered).to(match(/2/))
          expect(rendered).to(match(/3/))
          expect(rendered).to(match(/4/))
     end
end
