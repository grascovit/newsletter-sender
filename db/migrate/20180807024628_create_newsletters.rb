class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.text :body
      t.timestamp :sent_at
      t.references :list, foreign_key: { to_table: :recipient_lists }
      t.references :sender, foreign_key: true
      t.references :template, foreign_key: true

      t.timestamps
    end
  end
end
