require 'rails_helper'

RSpec.describe ArticleHistory, type: :model do
  describe "relation" do
    let(:user) {FactoryGirl.create(:user_default)}
    let(:article_type) {FactoryGirl.create(:article_type_default)}
    let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}

    describe "belongs_to" do
      context "when parent object exists" do
        it "should be able to save" do
          article_history = ArticleHistory.new(user_id: 1, last_updated_user_id: 1, article_type_id: 1, article: article, title: "title", body: "body")
          result = article_history.save
          expect(result).to be_truthy
        end
      end

      context "when article is nothing" do
        it "should be fail to save" do
          article_history = ArticleHistory.new(user_id: 1, last_updated_user_id: 1, article_type_id: 1, article_id: 99999, title: "title", body: "body")
          result = article_history.save
          expect(result).to be_falsy
        end
      end
    end
  end
end
