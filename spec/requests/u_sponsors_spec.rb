require 'rails_helper'

RSpec.describe "USponsors", type: :request do
  describe "GET /u_sponsors" do
    it "works! (now write some real specs)" do
      get u_sponsors_path
      expect(response).to have_http_status(200)
    end
  end
end
