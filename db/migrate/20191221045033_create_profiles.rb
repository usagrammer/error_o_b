class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :gender
      t.string :last_name
      t.string :first_name
      t.integer :height
      t.integer :weight
      t.integer :foot_size
      t.string :address
      t.string :skill
      t.string :favorite_food
      t.text :introduction
      t.references :user, forign_key: true
      t.timestamps
    end
  end
end
