require 'spec_helper'

describe HomeController do

  before (:each) do
    @current_user = FactoryGirl.create(:user)
    sign_in @current_user
  end

  describe "GET 'index'" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
