class CreateArticleTags < ActiveRecord::Migration[5.0]
  def change
    create_table :article_tags do |t|
      t.references :article, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end
