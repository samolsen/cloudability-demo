class CreateDvdRoles < ActiveRecord::Migration
  def change
    create_table :dvd_roles do |t|
      t.integer :dvd_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
