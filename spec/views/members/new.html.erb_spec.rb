require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      name: "MyString",
      email: "MyString",
      points: 1,
      paid_status: "MyString",
      access_type: 1
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input[name=?]", "member[name]"

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[points]"

      assert_select "input[name=?]", "member[paid_status]"

      assert_select "input[name=?]", "member[access_type]"
    end
  end
end
