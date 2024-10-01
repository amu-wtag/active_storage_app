class AddLastLoginToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :last_login, :datetime
  end
end
