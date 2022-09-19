class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.float :points
      t.boolean :paid_status
      t.integer :permission_id

      t.timestamps
    end
  end
end
