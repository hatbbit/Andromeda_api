class CreateArticleAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :article_authors do |t|
      t.references :article, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
