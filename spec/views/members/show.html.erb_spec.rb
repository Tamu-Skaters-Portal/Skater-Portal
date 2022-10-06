require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      name: "Name",
      email: "Email",
      points: 2,
      paid_status: "Paid Status",
      access_type: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Paid Status/)
    expect(rendered).to match(/3/)
  end
end
