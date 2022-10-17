class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
<<<<<<< HEAD:db/migrate/20221017061425_create_members.rb
      t.string :token
      t.integer :access_type
      t.integer :paid_status
      t.integer :points
=======
      t.integer :points
      t.string :paid_status
      t.integer :access_type
>>>>>>> test:db/migrate/20221006024732_create_members.rb

      t.timestamps
    end
  end
end
