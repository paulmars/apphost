class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :ipa

      t.timestamps
    end
  end
end
