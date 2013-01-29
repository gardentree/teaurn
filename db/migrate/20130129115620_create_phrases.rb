class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.references :boy
      t.string :title
      t.string :line
      t.string :image
      t.integer :number

      t.timestamps
    end
    add_index :phrases, :boy_id
  end
end
