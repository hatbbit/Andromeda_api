require 'rails_helper'
require 'articles_controller'

RSpec.describe ArticlesController, type: :controller do
  let!(:user) {FactoryGirl.create(:user_default, id: 1)}
  let(:article) {FactoryGirl.create(:article_default, id: 1)}

  describe "GET #index" do
    it "response successfully with an hTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "call Article.all once" do
      expect(Article).to receive(:all).once
      get :index
    end
  end

  describe "GET #show" do
    it "response successfully with an hTTP 200 status code" do
      get :show, params: { id: article.id }
      expect(response).to have_http_status(200)
    end

    it "call Article.find with GET article.id paramerter once" do
      expect(Article).to receive(:find).with(article.id.to_s).once
      get :show, params: { id: article.id }
    end
  end

  describe "POST #create" do
    it "response successfully with an hTTP 201 status code" do
      post :create, params: { article: { user_id: user.id, last_updated_user_id: user.id, article_type_id: article.article_type_id, title: article.title, body: article.body, draft: article.draft, version: article.version } }
      expect(response).to have_http_status(201)
    end

    it "call save with GET article params once" do
      expect_any_instance_of(Article).to receive(:save).once
      post :create, params: { article: { user_id: user.id, last_updated_user_id: user.id, article_type_id: article.article_type_id, title: article.title, body: article.body, draft: article.draft, version: article.version } }
    end
  end

  describe "PATCH #update" do
    it "response successfully with an hTTP 200 status code" do
      patch :update, params: { id: article.id, article: { body: article.body } }
      expect(response).to have_http_status(200)
    end

    it "call update with GET article params once" do
      expect_any_instance_of(Article).to receive(:update).once
      patch :update, params: { id: article.id, article: { body: article.body } }
    end
  end

  describe "DELETE #destroy" do
    it "response successfully with an hTTP 204 status code" do
      delete :destroy, params: { id: article.id }
      expect(response).to have_http_status(204)
    end

    it "call delete with GET article params once" do
      expect_any_instance_of(Article).to receive(:destroy).once
      delete :destroy, params: { id: article.id }
    end
  end

end
