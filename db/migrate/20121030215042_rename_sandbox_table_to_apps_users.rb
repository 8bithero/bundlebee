class RenameSandboxTableToAppsUsers < ActiveRecord::Migration
  def change
    rename_table :sandboxes, :apps_users
  end 
end
