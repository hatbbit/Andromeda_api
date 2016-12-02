require 'rails_helper'

RSpec.describe Action, type: :model do
  describe "relation" do
    describe "belongs_to" do
      let(:user) {FactoryGirl.create(:user_default)}
      let(:action_type) {FactoryGirl.create(:action_type_default)}
      let(:article_type) {FactoryGirl.create(:article_type_default)}
      let(:article) {FactoryGirl.create(:article_default, user: user, article_type: article_type, last_updated_user: user)}

      context "when parent object exists" do
        it "should be able to save" do
          action = Action.new(user: user, action_type: action_type, article: article)
          result = action.save
          expect(result).to be_truthy
        end
      end

      context "when parent object doesn't exist" do
        context "when user is nothing" do
          it "should be fail to save" do
            action = Action.new(user_id: 99999, action_type: action_type, article: article)
            result = action.save
            expect(result).to be_falsy
          end
        end

        context "when action_type is nothing" do
          it "should be fail to save" do
            action = Action.new(user: user, action_type_id: 99999, article: article)
            result = action.save
            expect(result).to be_falsy
          end
        end

        context "when article is nothing" do
          it "should be fail to save" do
            action = Action.new(user: user, action_type: action_type, article_id: 99999)
            result = action.save
            expect(result).to be_falsy
          end
        end
      end
    end
  end
end
