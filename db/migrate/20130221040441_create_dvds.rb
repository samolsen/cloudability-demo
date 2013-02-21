class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :name
      t.date :release_date
      t.text :summary
      t.string :asin

      t.timestamps
    end
  end
end
