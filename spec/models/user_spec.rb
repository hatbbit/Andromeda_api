require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create(:user_default)}
  let(:action_type) {FactoryGirl.create(:action_type_default)}
  let(:article_type) {FactoryGirl.create(:article_type_default)}
  let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}
  let(:action) {FactoryGirl.create(:action_default, user: user, action_type: action_type, article: article)}
  let(:article_author) {FactoryGirl.create(:article_author_default, user: user, article: article)}
  let(:comment) {FactoryGirl.create(:comment_default, user: user, article: article)}
  let(:like) {FactoryGirl.create(:like_default, user: user, article: article)}
  let(:stock) {FactoryGirl.create(:stock_default, user: user, article: article)}

  describe "relation" do

    describe "has_many" do
      context "when child object exists" do
        it "should be able to get action object" do
          result = user.actions
          expect(result).to eq([action])
        end

        it "should be able to get article_author object" do
          result = user.article_authors
          expect(result).to eq([article_author])
        end

        it "should be able to get articles object" do
          result = user.articles
          expect(result).to eq([article])
        end

        it "should be able to get comment object" do
          result = user.comments
          expect(result).to eq([comment])
        end

        it "should be able to get like object" do
          result = user.likes
          expect(result).to eq([like])
        end

        it "should be able to get stock object" do
          result = user.stocks
          expect(result).to eq([stock])
        end
      end
    end
  end
  describe "validates" do
    describe "name" do
      describe "length" do
        context "when length is 255" do
          it "should save" do
            user = User.new(name: "a"*255, email: "tanaka@example.com", email_confirmation: "tanaka@example.com", password_digest: "password")
            ret = user.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 256" do
          it "should not save" do
            user = User.new(name: "a"*256, email: "tanaka@example.com", email_confirmation: "tanaka@example.com", password_digest: "password")
            ret = user.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when name is not empty" do
          it "should save" do
            user = User.new(name: "tanaka", email: "tanaka@example.com", email_confirmation: "tanaka@example.com", password_digest: "password")
            ret = user.save
            expect(ret).to be_truthy
          end
        end

        context "when name is empty" do
          it "should not save" do
            user = User.new(name: "", email: "tanaka@example.com", email_confirmation: "tanaka@example.com", password_digest: "password")
            ret = user.save
            expect(ret).to be_falsy
          end
        end
      end
    end

    describe "email" do
      describe "email_confirmation" do
        context "when email == email_confirmation" do
          it "should save" do
            user = User.new(email: "tanaka@example.com", email_confirmation: "tanaka@example.com", name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_truthy
          end
        end

        context "when email != email_confirmation" do
          it "should not save" do
            user = User.new(email: "tanaka@example.com", email_confirmation: "suzuki@example.com", name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "length" do
        context "when length is 255" do
          it "should save" do
            user = User.new(email: "a"*255, email_confirmation: "a"*255, name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 256" do
          it "should not save" do
            user = User.new(email: "a"*256, email_confirmation: "a"*256, name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when email is not empty" do
          it "should save" do
            user = User.new(email: "tanaka@example.com", email_confirmation: "tanaka@example.com", name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_truthy
          end
        end

        context "when email is empty" do
          it "should not save" do
            user = User.new(email: "", email_confirmation: "tanaka@example.com", name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_falsy
          end
        end

        context "when email_confirmation is empty" do
          it "should not save" do
            user = User.new(email: "tanaka@example.com", email_confirmation: "", name: "tanaka", password_digest: "password")
            ret = user.save
            expect(ret).to be_falsy
          end
        end
      end
    end
  end
end
