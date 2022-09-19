class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.integer :members_id
      t.integer :event_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
