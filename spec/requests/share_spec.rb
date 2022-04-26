require 'rails_helper'

RSpec.describe "Shares", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/shares"
      expect(response).to have_http_status(:found)
    end
  end
  describe "GET /edit" do
    it "returns http success" do
      get "/shares/:id/edit"
      expect(response).to have_http_status(:found)
    end
  end
end
