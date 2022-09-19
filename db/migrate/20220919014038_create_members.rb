class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members, :primary_key => :member_id do |t|
      t.integer :member_id
      t.string :name
      t.string :email
      t.float :points
      t.boolean :paid_status
      t.integer :permission_id

      t.timestamps
    end
  end
end
