require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {FactoryGirl.create(:user_default)}
  let(:article_type) {FactoryGirl.create(:article_type_default)}
  let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}

  describe "relation" do
    describe "belongs_to" do
      context "when parent object exists" do
        it "should be able to save" do
          comment = Comment.new(user: user, article: article, body: "hello comment")
          result = comment.save
          expect(result).to be_truthy
        end
      end

      context "when parent object doesn't exist" do
        context "when user is nothing" do
          it "should be fail to save" do
            comment = Comment.new(user_id: 99999, article: article, body: "hello comment")
            result = comment.save
            expect(result).to be_falsy
          end
        end

        context "when article is nothing" do
          it "should be fail to save" do
            comment = Comment.new(user: user, article_id: 99999, body: "hello comment")
            result = comment.save
            expect(result).to be_falsy
          end
        end
      end
    end
  end

  describe "validates" do
    describe "body" do
      describe "length" do
        context "when length is 65535" do
          it "should save" do
            comment = Comment.new(body: "a"*65535, user: user, article: article)
            ret = comment.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 65536" do
          it "should not save" do
            comment = Comment.new(body: "a"*65536, user: user, article: article)
            ret = comment.save
            expect(ret).to be_falsy
          end
        end
      end
      describe "presence" do
        context "when body is not empty" do
          it "should save" do
            comment = Comment.new(body: "hello world", user: user, article: article)
            ret = comment.save
            expect(ret).to be_truthy
          end
        end

        context "when body is empty" do
          it "should not save" do
            comment = Comment.new(body: "", user: user, article: article)
            ret = comment.save
            expect(ret).to be_falsy
          end
        end
      end
    end
  end
end
