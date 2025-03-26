class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings
      t.string :tags

      t.timestamps
    end
  end
end
