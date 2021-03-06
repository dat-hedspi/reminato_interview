require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/:id"
      expect(response).to have_http_status(:found)
    end
  end

end
