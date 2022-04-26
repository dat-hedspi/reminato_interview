class CreateModelTests < ActiveRecord::Migration[6.1]
  def change
    create_table :model_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
