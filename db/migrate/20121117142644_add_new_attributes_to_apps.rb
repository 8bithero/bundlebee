class AddNewAttributesToApps < ActiveRecord::Migration
  def change
    add_column :apps, :description, :text
    add_column :apps, :icon_url,    :string
    add_column :apps, :points,      :integer
    add_column :apps, :rating,      :integer
  end
end
