require 'rails_helper'
require 'capybara'

RSpec.describe PagesController, type: :controller do

  describe "GET #over_ons" do
    it "returns http success" do
      get :over_ons
      expect(response).to have_http_status(:success)
    end
  end
end
