require 'rails_helper'

RSpec.describe "organizations/edit", type: :view do
  before(:each) do
    @organization = assign(:organization, Organization.create!(
      members_id: 1,
      event_id: 1,
      permission_id: 1
    ))
  end

  it "renders the edit organization form" do
    render

    assert_select "form[action=?][method=?]", organization_path(@organization), "post" do

      assert_select "input[name=?]", "organization[members_id]"

      assert_select "input[name=?]", "organization[event_id]"

      assert_select "input[name=?]", "organization[permission_id]"
    end
  end
end
