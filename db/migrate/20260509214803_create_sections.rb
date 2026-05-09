class CreateSections < ActiveRecord::Migration[8.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :position
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
