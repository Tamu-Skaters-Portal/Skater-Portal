require 'rails_helper'

RSpec.describe('finances/show', type: :view) do
     before do
          @finance = assign(:finance, Finance.create!(
                                           member_id: 2,
                                           amount: 3.5
                                      )
          )
     end

     it 'renders attributes in <p>' do
          render
          expect(rendered).to(match(/2/))
          expect(rendered).to(match(/3.5/))
     end
end
