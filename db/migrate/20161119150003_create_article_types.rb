class CreateArticleTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :article_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
