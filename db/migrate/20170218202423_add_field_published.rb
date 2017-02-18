class AddFieldPublished < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :published, :boolean, default: false
  end
end
