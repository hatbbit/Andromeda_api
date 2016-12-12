require 'rails_helper'
require 'users_controller'

RSpec.describe "users routeing", type: :routing do
  describe "GET #new" do
    it "#new is no route" do
      expect(:get => :new).not_to be_routable
    end
  end

  describe "GET #edit" do
    it "#edit is no route" do
      expect(:get => :edit).not_to be_routable
    end
  end
end
