require 'rails_helper'

RSpec.describe ArticleAuthor, type: :model do
  describe "relation" do
    describe "belongs_to" do
      let(:user) {FactoryGirl.create(:user_default)}
      let(:article_type) {FactoryGirl.create(:article_type_default)}
      let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}

      context "when parent object exists" do
        it "should be able to save" do
          article_author = ArticleAuthor.new(article: article, user: user)
        end
      end

      context "when parent object doesn't exist" do
        context "when user is nothing" do
          it "should be fail to save" do
            article_author = ArticleAuthor.new(article: article, user_id: 99999)
            result = article_author.save
            expect(result).to be_falsy
          end
        end

        context "when article is nothing" do
          it "should be fail to save" do
            article_author = ArticleAuthor.new(article_id: 99999, user: user)
            result = article_author.save
            expect(result).to be_falsy
          end
        end
      end

    end
  end
end
