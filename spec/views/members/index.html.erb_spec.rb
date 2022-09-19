require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        member_id: "",
        name: "Name",
        email: "Email",
        points: 2.5,
        paid_status: false,
        permission_id: ""
      ),
      Member.create!(
        member_id: "",
        name: "Name",
        email: "Email",
        points: 2.5,
        paid_status: false,
        permission_id: ""
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
