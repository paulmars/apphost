class AddSubdomainToApp < ActiveRecord::Migration
  def change
    add_column :apps, :subdomain, :string
  end
end
