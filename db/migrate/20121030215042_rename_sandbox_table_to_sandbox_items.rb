class RenameSandboxTableToAppsUsers < ActiveRecord::Migration
  def change
    rename_table :sandboxes, :sandbox_items
  end 
end
