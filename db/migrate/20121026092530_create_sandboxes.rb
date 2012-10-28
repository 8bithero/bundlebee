class CreateSandboxes < ActiveRecord::Migration
  def change
    create_table :sandboxes do |t|
      t.references :user
      t.references :app

      t.timestamps
    end
  end
end
