require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        name: "Name",
        email: "Email",
        points: 2,
        paid_status: "Paid Status",
        access_type: 3
      ),
      Member.create!(
        name: "Name",
        email: "Email",
        points: 2,
        paid_status: "Paid Status",
        access_type: 3
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Paid Status".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
