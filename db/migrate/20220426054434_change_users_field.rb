class ChangeUsersField < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      t.change :name, :string,     null: false, default: ""
      t.change :email, :string, default: "", null: true
    end

    add_index :users, :name,                unique: true
    remove_index :users, column: [:email], name: "index_users_on_email"
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
