class CreateInstructionSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :instruction_steps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :order
      t.text :text
      t.string :media_url

      t.timestamps
    end
  end
end
