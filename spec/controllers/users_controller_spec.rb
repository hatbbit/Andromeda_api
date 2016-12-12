require 'rails_helper'
require 'users_controller'

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryGirl.create(:user_default, id: 1)}
  let!(:user_params) {FactoryGirl.attributes_for(:user_default)}

  describe "GET #index" do
    it "response successfully with an hTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "call User.all once" do
      expect(User).to receive(:all).once
      get :index
    end
  end

  describe "GET #show" do
    it "response successfully with an hTTP 200 status code" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end

    it "call User.find with GET user.id paramerter once" do
      expect(User).to receive(:find).with(user.id.to_s).once
      get :show, params: { id: user.id }
    end
  end

  describe "POST #create" do
    it "response successfully with an hTTP 201 status code" do
      post :create, params: { user: { name: user.name, email: user.email, email_confirmation: user.email, password: user.password } }
      expect(response).to have_http_status(201)
    end

    it "call save with GET user params once" do
      expect_any_instance_of(User).to receive(:save).once
      post :create, params: { user: { name: user.name, email: user.email, email_confirmation: user.email, password: user.password } }
    end
  end

  describe "PATCH #update" do
    it "response successfully with an hTTP 200 status code" do
      patch :update, params: { id: user.id, user: { name: user.name } }
      expect(response).to have_http_status(200)
    end

    it "call update with GET user params once" do
      expect_any_instance_of(User).to receive(:update).once
      patch :update, params: { id: user.id, user: { name: user.name } }
    end
  end

  describe "DELETE #destroy" do
    it "response successfully with an hTTP 204 status code" do
      delete :destroy, params: { id: user.id }
      expect(response).to have_http_status(204)
    end

    it "call delete with GET user params once" do
      expect_any_instance_of(User).to receive(:destroy).once
      delete :destroy, params: { id: user.id }
    end
  end
end
