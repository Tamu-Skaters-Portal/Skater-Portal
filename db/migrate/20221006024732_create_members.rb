class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :token
      t.integer :access_type
      t.integer :paid_status
      t.integer :points

      t.timestamps
    end
  end
end
