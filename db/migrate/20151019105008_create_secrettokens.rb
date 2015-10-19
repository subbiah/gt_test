class CreateSecrettokens < ActiveRecord::Migration
  def change
    create_table :secrettokens do |t|
      t.string :code
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
