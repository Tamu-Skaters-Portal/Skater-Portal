require 'rails_helper'

RSpec.describe "permissions/edit", type: :view do
  before(:each) do
    @permission = assign(:permission, Permission.create!(
      member_access: false,
      officer_access: false
    ))
  end

  it "renders the edit permission form" do
    render

    assert_select "form[action=?][method=?]", permission_path(@permission), "post" do

      assert_select "input[name=?]", "permission[member_access]"

      assert_select "input[name=?]", "permission[officer_access]"
    end
  end
end
