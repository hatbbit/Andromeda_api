class CreateArticleHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :article_histories do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :last_updated_user_id, null: false
      t.references :article_type, foreign_key: true, null: false
      t.references :article, foreign_key: true, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :draft, null: false, default: false
      t.integer :version, null: false, default: 1

      t.timestamps
    end
  end
end
