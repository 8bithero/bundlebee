class CreateSandboxes < ActiveRecord::Migration
  def change
    create_table :sandboxes do |t|
      t.reference :user_id
      t.reference :app_id

      t.timestamps
    end
  end
end
