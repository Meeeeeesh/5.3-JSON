class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string :dom_one, null: false
      t.string :dom_two, null: false
      t.string :pop,     null: false
      t.string :sec_one, null: false
      t.string :sec_two, null: false
      t.string :name,    null: false
      t.timestamps null: false
    end
  end
end
