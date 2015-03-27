class AddCssToApp < ActiveRecord::Migration
  def change
    add_column :apps, :css, :text
  end
end
