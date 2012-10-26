class CreateSandboxes < ActiveRecord::Migration
  def change
    create_table :sandboxes do |t|
      t.references :user_id
      t.references :app_id

      t.timestamps
    end
  end
end
