class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.integer :points
      t.string :paid_status
      t.integer :access_type

      t.timestamps
    end
  end
end
