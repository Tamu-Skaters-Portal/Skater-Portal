require 'rails_helper'

RSpec.describe('finances/edit', type: :view) do
     before do
          @finance = assign(:finance, Finance.create!(
                                           member_id: 1,
                                           amount: 1.5
                                      )
          )
     end

     it 'renders the edit finance form' do
          render

          assert_select 'form[action=?][method=?]', finance_path(@finance), 'post' do
               assert_select 'input[name=?]', 'finance[member_id]'

               assert_select 'input[name=?]', 'finance[amount]'
          end
     end
end
