class ChangeTypeDescriptionOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :description, :text
  end
end
