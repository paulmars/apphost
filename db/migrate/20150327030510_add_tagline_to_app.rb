class AddTaglineToApp < ActiveRecord::Migration
  def change
    add_column :apps, :tagline, :string
  end
end
