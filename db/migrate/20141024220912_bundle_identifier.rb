class BundleIdentifier < ActiveRecord::Migration
  def change
    add_column :builds, :bundle_identifier, :string
  end
end
