require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "relation" do
    let(:user) {FactoryGirl.create(:user_default)}
    let(:article_type) {FactoryGirl.create(:article_type_default)}
    let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}

    describe "belongs_to" do
      context "when parent object exists" do
        it "should be able to save" do
          like = Like.new(user: user, article: article)
          result = like.save
          expect(result).to be_truthy
        end
      end

      context "when parent object doesn't exist" do
        context "when user is nothing" do
          it "should be fail to save" do
            like = Like.new(user_id: 99999, article: article)
            result = like.save
            expect(result).to be_falsy
          end
        end

        context "when article is nothing" do
          it "should be fail to save" do
            like = Like.new(user_id: 99999, article: article)
            result = like.save
            expect(result).to be_falsy
          end
        end
      end
    end
  end
end
