class AddSectionToLessons < ActiveRecord::Migration[8.0]
  def change
    add_reference :lessons, :section, null: true, foreign_key: true
  end
end
