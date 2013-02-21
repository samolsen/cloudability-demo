class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.date :birth_date
      t.string :gender

      t.timestamps
    end
  end
end
