require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) {FactoryGirl.create(:user_default)}
  let(:article_type) {FactoryGirl.create(:article_type_default)}
  let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}
  let(:action_type) {FactoryGirl.create(:action_type_default)}
  let(:action) {FactoryGirl.create(:action_default, user: user, action_type: action_type, article: article)}
  let(:article_author) {FactoryGirl.create(:article_author_default, user: user, article: article)}
  let(:tag) {FactoryGirl.create(:tag_default)}
  let!(:article_tag) {FactoryGirl.create(:article_tag_default, article: article, tag: tag)}
  let(:comment) {FactoryGirl.create(:comment_default, user: user, article: article)}
  let(:like) {FactoryGirl.create(:like_default, user: user, article: article)}
  let(:stock) {FactoryGirl.create(:stock_default, user: user, article: article)}

  describe "relation" do
    describe "belongs_to" do
      context "when parent object exists" do
        it "should be able to save" do
          article = Article.new(user: user, last_updated_user: user, article_type: article_type, title: "title", body: "body")
          result = article.save
          expect(result).to be_truthy
        end
      end

      context "when parent object doesn't exist" do
        context "when user is nothing" do
          it "should be fail to save" do
            article = Article.new(user_id: 99999, last_updated_user: user, article_type: article_type, title: "title", body: "body")
            result = article.save
            expect(result).to be_falsy
          end
        end

        context "when last_updated_user is nothing" do
          it "should be fail to save" do
            article = Article.new(user: user, last_updated_user_id: 99999, article_type: article_type, title: "title", body: "body")
            result = article.save
            expect(result).to be_falsy
          end
        end

        context "when article_type is nothing" do
          it "should be fail to save" do
            article = Article.new(user: user, last_updated_user: user, article_type_id: 99999, title: "title", body: "body")
            result = article.save
            expect(result).to be_falsy
          end
        end
      end
    end
    describe "has_many" do
      context "when action object exists" do
        it "should be able to get child object" do
          result = article.actions
          expect(result).to eq([action])
        end
      end

      context "when article_author object exists" do
        it "should be able to get child object" do
          result = article.article_authors
          expect(result).to eq([article_author])
        end
      end

      context "when article_tags object exists" do
        it "should be able to get child object" do
          result = article.article_tags
          expect(result).to eq([article_tag])
        end
      end

      context "when comment object exists" do
        it "should be able to get child object" do
          result = article.comments
          expect(result).to eq([comment])
        end
      end

      context "when like object exists" do
        it "should be able to get child object" do
          result = article.likes
          expect(result).to eq([like])
        end
      end

      context "when stock object exists" do
        it "should be able to get child object" do
          result = article.stocks
          expect(result).to eq([stock])
        end
      end

      context "when tags object exists" do
        it "should be able to get child object" do
          result = article.tags
          expect(result).to eq([tag])
        end
      end
    end
  end

  describe "validates" do
    describe "title" do
      describe "length" do
        context "when length is 255" do
          it "should save" do
            article = Article.new(title: "a"*255, user: user, last_updated_user: user, article_type: article_type, body: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 256" do
          it "should not save" do
            article = Article.new(title: "a"*256, user: user, last_updated_user: user, article_type: article_type, body: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when title is not empty" do
          it "should save" do
            article = Article.new(title: "hello world", user: user, last_updated_user: user, article_type: article_type, body: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_truthy
          end
        end

        context "when title is empty" do
          it "should not save" do
            article = Article.new(title: "", user: user, last_updated_user: user, article_type: article_type, body: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_falsy
          end
        end
      end
    end
    describe "body" do
      describe "length" do
        context "when length is 65535" do
          it "should save" do
            article = Article.new(body: "a"*65535, user: user, last_updated_user: user, article_type: article_type, title: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 65536" do
          it "should not save" do
            article = Article.new(body: "a"*65536, user: user, last_updated_user: user, article_type: article_type, title: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when body is not empty" do
          it "should save" do
            article = Article.new(body: "hello world", user: user, last_updated_user: user, article_type: article_type, title: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_truthy
          end
        end

        context "when body is empty" do
          it "should not save" do
            article = Article.new(body: "", user: user, last_updated_user: user, article_type: article_type, title: "hello world", draft: false, version: 1)
            ret = article.save
            expect(ret).to be_falsy
          end
        end
      end
    end
    describe "draft" do
      describe "inclusion" do
        context "when draft is true" do
          it "should save" do
            article = Article.new(draft: true, body: "hello world", user: user, last_updated_user: user, article_type: article_type, title: "hello world", version: 1)
            ret = article.save
            expect(ret).to be_truthy
          end
        end

        context "when draft is false" do
          it "should save" do
            article = Article.new(draft: false, body: "hello world", user: user, last_updated_user: user, article_type: article_type, title: "hello world", version: 1)
            ret = article.save
            expect(ret).to be_truthy
          end
        end

        context "when draft is nil" do
          it "should not save" do
            article = Article.new(draft: nil, body: "hello world", user: user, last_updated_user: user, article_type: article_type, title: "hello world", version: 1)
            article.save
            expect(article.errors.messages[:draft]).to eq(["is not included in the list"])
          end
        end
      end
    end

  end
end
