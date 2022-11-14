require 'rails_helper'

RSpec.describe('members/edit', type: :view) do
     before do
          @member = assign(:member, Member.create!(
                                         name: 'MyString',
                                         email: 'MyString',
                                         token: 'MyString',
                                         access_type: 1,
                                         paid_status: 1,
                                         points: 1
                                    )
          )
     end

     it 'renders the edit member form' do
          render

          assert_select 'form[action=?][method=?]', member_path(@member), 'post' do
               assert_select 'input[name=?]', 'member[name]'

               assert_select 'input[name=?]', 'member[email]'

               assert_select 'input[name=?]', 'member[token]'

               assert_select 'input[name=?]', 'member[access_type]'

               assert_select 'input[name=?]', 'member[paid_status]'

               assert_select 'input[name=?]', 'member[points]'
          end
     end
end
