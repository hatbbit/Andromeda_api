require 'rails_helper'

RSpec.describe ArticleType, type: :model do
  let(:user) {FactoryGirl.create(:user_default)}
  let(:article_type) {FactoryGirl.create(:article_type_default)}
  let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}

  describe "relation" do
    describe "has_many" do
      context "when child object exists" do
        it "should be able to get article object" do
          result = article_type.articles
          expect(result).to eq([article])
        end

      end
    end
  end

  describe "validates" do
    describe "name" do
      describe "length" do
        context "when length is 255" do
          it "should save" do
            article_type = ArticleType.new(name: "a"*255)
            ret = article_type.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 256" do
          it "should not save" do
            article_type = ArticleType.new(name: "a"*256)
            ret = article_type.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when name is not empty" do
          it "should save" do
            article_type = ArticleType.new(name: "hello world")
            ret = article_type.save
            expect(ret).to be_truthy
          end
        end

        context "when name is empty" do
          it "should not save" do
            article_type = ArticleType.new(name: "")
            ret = article_type.save
            expect(ret).to be_falsy
          end
        end
      end
    end
  end

  describe "enum" do
    describe "types" do
      context "when find by id 1" do
        it "should return 'blog'" do
          at = ArticleType.find(1)
          expect(at.name).to eq("blog")
        end
      end

      context "when find by id 2" do
        it "should return 'url'" do
          at = ArticleType.find(2)
          expect(at.name).to eq("url")
        end
      end

      context "when find by id 3" do
        it "should return 'book'" do
          at = ArticleType.find(3)
          expect(at.name).to eq("book")
        end
      end
    end
  end
end
