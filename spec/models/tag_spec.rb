require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "relation" do
    let(:user) {FactoryGirl.create(:user_default)}
    let(:article_type) {FactoryGirl.create(:article_type_default)}
    let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}
    let(:tag) {FactoryGirl.create(:tag_default)}
    let!(:article_tag) {FactoryGirl.create(:article_tag_default, article: article, tag: tag)}

    describe "has_many" do
      context "when child object exists" do
        it "should be able to get article_tag object" do
          result = tag.article_tags
          expect(result).to eq([article_tag])
        end

        it "should be able to get article object" do
          result = tag.articles
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
            tag = Tag.new(name: "あ"*255)
            ret = tag.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 256" do
          it "should not save" do
            tag = Tag.new(name: "あ"*256)
            ret = tag.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when name is not empty" do
          it "should save" do
            tag = Tag.new(name: "hello world")
            ret = tag.save
            expect(ret).to be_truthy
          end
        end

        context "when name is empty" do
          it "should not save" do
            tag = Tag.new(name: "")
            ret = tag.save
            expect(ret).to be_falsy
          end
        end
      end
    end
  end
end
