class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string  :name
      t.string  :bundle_id
      t.integer :developer_id

      t.timestamps
    end
  end
end
