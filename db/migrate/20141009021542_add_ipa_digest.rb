class AddIpaDigest < ActiveRecord::Migration
  def change
  	add_column :builds, :ipa_digest, :string
  end
end
