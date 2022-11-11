require 'rails_helper'

RSpec.describe('events/show', type: :view) do
     before do
          @event = assign(:event, Event.create!(
                                       location: 'Location',
                                       date: '2022-10-18 03:00:00'
                                  )
          )
     end

     it 'renders attributes in <p>' do
          render
          expect(rendered).to(match(/Location/))
     end
end
