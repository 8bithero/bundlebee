class AddNewAttributesToApps < ActiveRecord::Migration
  def change
    add_column :apps, :description, :text
    add_column :apps, :icon_url, :string
  end
end
