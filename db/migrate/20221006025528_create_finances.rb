class CreateFinances < ActiveRecord::Migration[6.1]
  def change
    create_table :finances do |t|
      t.integer :member_id
      t.float :amount

      t.timestamps
    end
  end
end
