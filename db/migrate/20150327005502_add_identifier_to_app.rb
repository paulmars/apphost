class AddIdentifierToApp < ActiveRecord::Migration
  def change
    add_column :apps, :identifier, :string
    add_column :apps, :icon, :string
  end
end
