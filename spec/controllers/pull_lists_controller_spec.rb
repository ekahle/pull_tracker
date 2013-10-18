require 'spec_helper'

describe PullListsController do

  before (:each) do
    @current_user = FactoryGirl.create(:user)
    sign_in @current_user
    @pull = FactoryGirl.create(:pull)
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:pull_list).merge(pull_id: @pull.id) }

  let(:valid_session) { {} }

  describe "GET index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns all pull_lists as @pull_lists" do
      pull_list = PullList.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:pull_lists)).to eq([pull_list])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before(:each) do
      pull_list = PullList.create! valid_attributes
      get :show, {id: pull_list.to_param}, valid_session
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested pull_list as @pull_list" do
      expect(assigns(:pull_list)).to eq(PullList.last)
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

    it "assigns a new pull_list as @pull_list" do
      expect(assigns(:pull_list)).to be_a_new(PullList)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    before(:each) do
      pull_list = PullList.create! valid_attributes
      get :edit, {id: pull_list.to_param}, valid_session
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested pull_list as @pull_list" do
      expect(assigns(:pull_list)).to eq(PullList.last)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new PullList" do
        expect {
          post :create, {pull_list: valid_attributes}, valid_session
        }.to change(PullList, :count).by(1)
      end

      it "displays a notice of success" do
        post :create, {pull_list: valid_attributes}, valid_session
        expect(flash[:notice]).to match /successfully created/
      end

      it "assigns a newly created pull_list as @pull_list" do
        post :create, {pull_list: valid_attributes}, valid_session
        expect(assigns(:pull_list)).to be_a(PullList)
        expect(assigns(:pull_list)).to be_persisted
      end

      it "redirects to the created pull_list" do
        post :create, {pull_list: valid_attributes}, valid_session
        expect(response).to redirect_to(PullList.last)
      end
    end

    context "with invalid params" do
      it "does not create a new PullList" do
        expect {
          post :create, {pull_list: { pull_id: nil }}, valid_session
        }.to change(PullList, :count).by(0)
      end

      it "assigns a newly created but unsaved pull_list as @pull_list" do
        PullList.any_instance.stub(:save).and_return(false)
        post :create, {pull_list: { pull_id: nil }}, valid_session
        expect(assigns(:pull_list)).to be_a_new(PullList)
      end

      it "re-renders the 'new' template" do
        PullList.any_instance.stub(:save).and_return(false)
        post :create, {pull_list: { pull_id: nil }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested pull_list" do
        pull_list = PullList.create! valid_attributes
        PullList.any_instance.should_receive(:update).with({ "file" => "MyString" })
        put :update, {id: pull_list.to_param, pull_list: { "file" => "MyString" }}, valid_session
      end

      it "displays a notice of success" do
        pull_list = PullList.create! valid_attributes
        put :update, {id: pull_list.to_param, pull_list: valid_attributes}, valid_session
        expect(flash[:notice]).to match /successfully updated/
      end

      it "assigns the requested pull_list as @pull_list" do
        pull_list = PullList.create! valid_attributes
        put :update, {id: pull_list.to_param, pull_list: valid_attributes}, valid_session
        expect(assigns(:pull_list)).to eq(pull_list)
      end

      it "redirects to the pull_list" do
        pull_list = PullList.create! valid_attributes
        put :update, {id: pull_list.to_param, pull_list: valid_attributes}, valid_session
        expect(response).to redirect_to(pull_list)
      end
    end

    context "with invalid params" do
      it "assigns the pull_list as @pull_list" do
        pull_list = PullList.create! valid_attributes
        PullList.any_instance.stub(:save).and_return(false)
        put :update, {id: pull_list.to_param, pull_list: { pull_id: nil }}, valid_session
        expect(assigns(:pull_list)).to eq(pull_list)
      end

      it "re-renders the 'edit' template" do
        pull_list = PullList.create! valid_attributes
        PullList.any_instance.stub(:save).and_return(false)
        put :update, {id: pull_list.to_param, pull_list: { pull_id: nil }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pull_list" do
      pull_list = PullList.create! valid_attributes
      expect {
        delete :destroy, {id: pull_list.to_param}, valid_session
      }.to change(PullList, :count).by(-1)
    end

    it "displays a notice of success" do
      pull_list = PullList.create! valid_attributes
      delete :destroy, {id: pull_list.to_param}, valid_session
      expect(flash[:notice]).to match /successfully deleted/
    end

    it "redirects to the pull_lists list" do
      pull_list = PullList.create! valid_attributes
      delete :destroy, {id: pull_list.to_param}, valid_session
      expect(response).to redirect_to(pull_lists_url)
    end
  end

end
