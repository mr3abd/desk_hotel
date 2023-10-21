require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/room/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/room/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/room/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/room/update"
      expect(response).to have_http_status(:success)
    end
  end

end
