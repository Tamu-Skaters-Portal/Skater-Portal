require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      members_id: 1,
      event_id: 1,
      permission_id: 1
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input[name=?]", "organization[members_id]"

      assert_select "input[name=?]", "organization[event_id]"

      assert_select "input[name=?]", "organization[permission_id]"
    end
  end
end
