require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        location: "Location",
        date: "2022-10-18 03:00:00"
      ),
      Event.create!(
        location: "Location",
        date: "2022-10-18 03:00:00"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "Location".to_s, count: 2
  end
end
