class AddBackgroundToApp < ActiveRecord::Migration
  def change
    add_column :apps, :background, :string
  end
end
