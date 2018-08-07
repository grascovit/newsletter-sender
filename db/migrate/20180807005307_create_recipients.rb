class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.references :list, foreign_key: { to_table: :recipient_lists }

      t.timestamps
    end

    add_index :recipients, %i[email list_id], unique: true
  end
end
