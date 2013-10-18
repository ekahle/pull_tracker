require 'spec_helper'

describe PullsController do

  before (:each) do
    @current_user = FactoryGirl.create(:user)
    sign_in @current_user
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:pull) }

  let(:valid_session) { {} }

  describe "GET index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns all pulls as @pulls" do
      pull = Pull.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:pulls)).to eq([pull])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before(:each) do
      pull = Pull.create! valid_attributes
      get :show, {id: pull.to_param}, valid_session
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested pull as @pull" do
      expect(assigns(:pull)).to eq(Pull.last)
    end

    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    before(:each) { get :new, {}, valid_session }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns a new pull as @pull" do
      expect(assigns(:pull)).to be_a_new(Pull)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    before(:each) do
      pull = Pull.create! valid_attributes
      get :edit, {id: pull.to_param}, valid_session
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested pull as @pull" do
      expect(assigns(:pull)).to eq(Pull.last)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Pull" do
        expect {
          post :create, {pull: valid_attributes}, valid_session
        }.to change(Pull, :count).by(1)
      end

      it "displays a notice of success" do
        post :create, {pull: valid_attributes}, valid_session
        expect(flash[:notice]).to match /successfully created/
      end

      it "assigns a newly created pull as @pull" do
        post :create, {pull: valid_attributes}, valid_session
        expect(assigns(:pull)).to be_a(Pull)
        expect(assigns(:pull)).to be_persisted
      end

      it "redirects to the created pull" do
        post :create, {pull: valid_attributes}, valid_session
        expect(response).to redirect_to(Pull.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Pull" do
        expect {
          post :create, {pull: { status: "" }}, valid_session
        }.to change(Pull, :count).by(0)
      end

      it "assigns a newly created but unsaved pull as @pull" do
        Pull.any_instance.stub(:save).and_return(false)
        post :create, {pull: { status: "" }}, valid_session
        expect(assigns(:pull)).to be_a_new(Pull)
      end

      it "re-renders the 'new' template" do
        Pull.any_instance.stub(:save).and_return(false)
        post :create, {pull: { status: "" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested pull" do
        pull = Pull.create! valid_attributes
        Pull.any_instance.should_receive(:update).with({ "status" => "MyString" })
        put :update, {id: pull.to_param, pull: { "status" => "MyString" }}, valid_session
      end

      it "displays a notice of success" do
        pull = Pull.create! valid_attributes
        put :update, {id: pull.to_param, pull: valid_attributes}, valid_session
        expect(flash[:notice]).to match /successfully updated/
      end

      it "assigns the requested pull as @pull" do
        pull = Pull.create! valid_attributes
        put :update, {id: pull.to_param, pull: valid_attributes}, valid_session
        expect(assigns(:pull)).to eq(pull)
      end

      it "redirects to the pull" do
        pull = Pull.create! valid_attributes
        put :update, {id: pull.to_param, pull: valid_attributes}, valid_session
        expect(response).to redirect_to(pull)
      end
    end

    context "with invalid params" do
      it "assigns the pull as @pull" do
        pull = Pull.create! valid_attributes
        Pull.any_instance.stub(:save).and_return(false)
        put :update, {id: pull.to_param, pull: { status: "" }}, valid_session
        expect(assigns(:pull)).to eq(pull)
      end

      it "re-renders the 'edit' template" do
        pull = Pull.create! valid_attributes
        Pull.any_instance.stub(:save).and_return(false)
        put :update, {id: pull.to_param, pull: { status: "" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pull" do
      pull = Pull.create! valid_attributes
      expect {
        delete :destroy, {id: pull.to_param}, valid_session
      }.to change(Pull, :count).by(-1)
    end

    it "displays a notice of success" do
      pull = Pull.create! valid_attributes
      delete :destroy, {id: pull.to_param}, valid_session
      expect(flash[:notice]).to match /successfully deleted/
    end

    it "redirects to the pulls list" do
      pull = Pull.create! valid_attributes
      delete :destroy, {id: pull.to_param}, valid_session
      expect(response).to redirect_to(pulls_url)
    end
  end

end
