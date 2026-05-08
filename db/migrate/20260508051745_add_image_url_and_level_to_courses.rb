class AddImageUrlAndLevelToCourses < ActiveRecord::Migration[8.1]
  def change
    add_column :courses, :image_url, :string
    add_column :courses, :level, :string
  end
end
