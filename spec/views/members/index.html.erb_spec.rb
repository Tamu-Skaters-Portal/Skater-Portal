# require 'rails_helper'

# RSpec.describe "members/index", type: :view do
#   before(:each) do
#     assign(:members, [
#       Member.create!(
#         name: "Name",
#         email: "Email",
#         token: "Token",
#         access_type: 2,
#         paid_status: 3,
#         points: 4
#       ),
#       Member.create!(
#         name: "Name",
#         email: "Email",
#         token: "Token",
#         access_type: 2,
#         paid_status: 3,
#         points: 4
#       )
#     ])
#   end

#   it "renders a list of members" do
#     render
#     assert_select "tr>td", text: "Name".to_s, count: 2
#     assert_select "tr>td", text: "Email".to_s, count: 2
#     assert_select "tr>td", text: "Token".to_s, count: 2
#     assert_select "tr>td", text: 2.to_s, count: 2
#     assert_select "tr>td", text: 3.to_s, count: 2
#     assert_select "tr>td", text: 4.to_s, count: 2
#   end
# end
