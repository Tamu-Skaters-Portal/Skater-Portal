require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        members_id: 2,
        event_id: 3,
        permission_id: 4
      ),
      Organization.create!(
        members_id: 2,
        event_id: 3,
        permission_id: 4
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
