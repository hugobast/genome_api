require "spec_helper"
require "support"

describe SpeciesController do

  before do
    create_organism!
  end

  describe "GET 'index'" do
    it "returns all species json response" do
      get :index, format: :json
      expect(response.body).to match("E. coli")
    end
  end

  describe "GET 'show'" do
    it "returns all species gene sequences json response" do
      get :show, id: 1, format: :json
      expect(response.body).to match("gidA")
      expect(response.body).to match("dnaA")
      expect(response.body).to match("gyrA")
    end
  end

end
