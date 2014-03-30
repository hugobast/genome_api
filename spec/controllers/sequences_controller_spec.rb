require "spec_helper"
require "support"

describe SequencesController do
  before do
    create_organisms!
  end

  describe "GET 'index'" do
    it "returns all species representation of that gene" do
      get :show, id: "gyrA", format: :json
      expect(response.body).to match("tttaaa")
      expect(response.body).to match("aaattt")
      expect(response.body).to match("cccaaa")
    end
  end
end
