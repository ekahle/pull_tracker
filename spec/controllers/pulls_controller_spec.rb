require 'spec_helper'

describe PullsController do

  before (:each) do
    @current_user = FactoryGirl.create(:user)
    sign_in @current_user
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:pull) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PullsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pulls as @pulls" do
      pull = Pull.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pulls).should eq([pull])
    end
  end

  describe "GET show" do
    it "assigns the requested pull as @pull" do
      pull = Pull.create! valid_attributes
      get :show, {:id => pull.to_param}, valid_session
      assigns(:pull).should eq(pull)
    end
  end

  describe "GET new" do
    it "assigns a new pull as @pull" do
      get :new, {}, valid_session
      assigns(:pull).should be_a_new(Pull)
    end
  end

  describe "GET edit" do
    it "assigns the requested pull as @pull" do
      pull = Pull.create! valid_attributes
      get :edit, {:id => pull.to_param}, valid_session
      assigns(:pull).should eq(pull)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pull" do
        expect {
          post :create, {:pull => valid_attributes}, valid_session
        }.to change(Pull, :count).by(1)
      end

      it "assigns a newly created pull as @pull" do
        post :create, {:pull => valid_attributes}, valid_session
        assigns(:pull).should be_a(Pull)
        assigns(:pull).should be_persisted
      end

      it "redirects to the created pull" do
        post :create, {:pull => valid_attributes}, valid_session
        response.should redirect_to(Pull.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pull as @pull" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pull.any_instance.stub(:save).and_return(false)
        post :create, {:pull => { "name" => "invalid value" }}, valid_session
        assigns(:pull).should be_a_new(Pull)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pull.any_instance.stub(:save).and_return(false)
        post :create, {:pull => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pull" do
        pull = Pull.create! valid_attributes
        # Assuming there are no other pulls in the database, this
        # specifies that the Pull created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Pull.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => pull.to_param, :pull => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested pull as @pull" do
        pull = Pull.create! valid_attributes
        put :update, {:id => pull.to_param, :pull => valid_attributes}, valid_session
        assigns(:pull).should eq(pull)
      end

      it "redirects to the pull" do
        pull = Pull.create! valid_attributes
        put :update, {:id => pull.to_param, :pull => valid_attributes}, valid_session
        response.should redirect_to(pull)
      end
    end

    describe "with invalid params" do
      it "assigns the pull as @pull" do
        pull = Pull.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pull.any_instance.stub(:save).and_return(false)
        put :update, {:id => pull.to_param, :pull => { "name" => "invalid value" }}, valid_session
        assigns(:pull).should eq(pull)
      end

      it "re-renders the 'edit' template" do
        pull = Pull.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pull.any_instance.stub(:save).and_return(false)
        put :update, {:id => pull.to_param, :pull => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pull" do
      pull = Pull.create! valid_attributes
      expect {
        delete :destroy, {:id => pull.to_param}, valid_session
      }.to change(Pull, :count).by(-1)
    end

    it "redirects to the pulls list" do
      pull = Pull.create! valid_attributes
      delete :destroy, {:id => pull.to_param}, valid_session
      response.should redirect_to(pulls_url)
    end
  end

end
