class CreateSenders < ActiveRecord::Migration[5.2]
  def change
    create_table :senders do |t|
      t.string :name
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
