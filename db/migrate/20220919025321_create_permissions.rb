class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.boolean :member_access
      t.boolean :officer_access

      t.timestamps
    end
  end
end
