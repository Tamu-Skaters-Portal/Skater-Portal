require 'rails_helper'

RSpec.describe('events/index', type: :view) do
     before do
          assign(:events, [
               Event.create!(
                    location: 'Location'
               ),
               Event.create!(
                    location: 'Location'
               )
          ]
          )
     end

     it 'renders a list of events' do
          render
          assert_select 'tr>td', text: 'Location'.to_s, count: 2
     end
end
