require 'rails_helper'

RSpec.describe "Localizacaos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/localizacao/index"
      expect(response).to have_http_status(:success)
    end
  end

end
