require 'rails_helper'

RSpec.describe ArticleTag, type: :model do
  describe "relation" do
    describe "belongs_to" do
      let(:user) {FactoryGirl.create(:user_default)}
      let(:article_type) {FactoryGirl.create(:article_type_default)}
      let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}
      let(:tag) {FactoryGirl.create(:tag_default)}
      
      context "when parent object exists" do
        it "should be able to save" do
          article_tag = ArticleTag.new(article: article, tag: tag)
          result = article_tag.save
          expect(result).to be_truthy
        end
      end

      context "when parent object doesn't exist" do
        context "when article is nothing" do
          it "should be fail to save" do
            article_tag = ArticleTag.new(article_id: 99999, tag: tag)
            result = article_tag.save
            expect(result).to be_falsy
          end
        end

        context "when tag is nothing" do
          it "should be fail to save" do
            article_tag = ArticleTag.new(article: article, tag_id: 99999)
            result = article_tag.save
            expect(result).to be_falsy
          end
        end
      end
    end
  end
end
