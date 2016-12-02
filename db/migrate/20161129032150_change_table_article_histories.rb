class ChangeTableArticleHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :article_histories, :force => true do |t|
      t.integer :user_id, null: false
      t.integer :last_updated_user_id, null: false
      t.integer :article_type_id, null: false
      t.references :article, foreign_key: true, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :draft, null: false, default: false
      t.integer :version, null: false, default: 1

      t.timestamps
    end
  end
end
