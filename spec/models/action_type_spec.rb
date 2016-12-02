require 'rails_helper'

RSpec.describe ActionType, type: :model do
  let(:user) {FactoryGirl.create(:user_default)}
  let(:article_type) {FactoryGirl.create(:article_type_default)}
  let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}
  let(:action_type) {FactoryGirl.create(:action_type_default)}
  let(:action) {FactoryGirl.create(:action_default, user: user, action_type: action_type, article: article)}

  describe "relation" do
    describe "has_many" do
      context "when child object exists" do
        it "should be able to get child object" do
          result = action_type.actions
          expect(result).to eq([action])
        end
      end
    end
  end

  describe "validates" do
    describe "name" do
      describe "length" do
        context "when length is 255" do
          it "should save" do
            action_type = ActionType.new(name: "a"*255)
            ret = action_type.save
            expect(ret).to be_truthy
          end
        end

        context "when length is 256" do
          it "should not save" do
            action_type = ActionType.new(name: "a"*256)
            ret = action_type.save
            expect(ret).to be_falsy
          end
        end
      end

      describe "presence" do
        context "when name is not empty" do
          it "should save" do
            action_type = ActionType.new(name: "hello world")
            ret = action_type.save
            expect(ret).to be_truthy
          end
        end

        context "when name is empty" do
          it "should not save" do
            action_type = ActionType.new(name: "")
            ret = action_type.save
            expect(ret).to be_falsy
          end
        end
      end
    end
  end
end
