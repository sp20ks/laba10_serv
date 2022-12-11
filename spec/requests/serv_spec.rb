require 'rails_helper'

RSpec.describe "Servs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/serv/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /result" do
    it "returns http success" do
      get "/serv/result"
      expect(response).to have_http_status(:success)
    end
  end

end
