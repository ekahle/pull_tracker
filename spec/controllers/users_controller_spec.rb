require 'spec_helper'

describe UsersController do

  before (:each) do
    DatabaseCleaner.clean_with(:truncation)
    @current_user = FactoryGirl.create(:user)
    sign_in @current_user
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:user) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:user, password: '2short') }

  let(:valid_session) { {} }

  describe "GET index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([@current_user, user])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    before(:each) do
      user = User.create! valid_attributes
      get :show, {id: user.to_param}, valid_session
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested user as @user" do
      expect(assigns(:user)).to eq(User.last)
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

    it "assigns a new user as @user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    before(:each) do
      user = User.create! valid_attributes
      get :edit, {id: user.to_param}, valid_session
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested user as @user" do
      expect(assigns(:user)).to eq(User.last)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {user: valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "displays a notice of success" do
        post :create, {user: valid_attributes}, valid_session
        expect(flash[:notice]).to match /successfully created/
      end

      it "assigns a newly created user as @user" do
        post :create, {user: valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {user: valid_attributes}, valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid params" do
      it "does not create a new User" do
        expect {
          post :create, {user: { name: "" }}, valid_session
        }.to change(User, :count).by(0)
      end

      it "assigns a newly created but unsaved user as @user" do
        User.any_instance.stub(:save).and_return(false)
        post :create, {user: invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        User.any_instance.stub(:save).and_return(false)
        post :create, {user: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        User.any_instance.should_receive(:update).with({ 'email' => 'new@email.com' })
        put :update, {id: user.to_param, user: { 'email' => 'new@email.com' }}, valid_session
      end

      it "displays a notice of success" do
        user = User.create! valid_attributes
        put :update, {id: user.to_param, user: valid_attributes}, valid_session
        expect(flash[:notice]).to match /successfully updated/
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {id: user.to_param, user: valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, {id: user.to_param, user: valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        User.any_instance.stub(:save).and_return(false)
        put :update, {id: user.to_param, user: invalid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        User.any_instance.stub(:save).and_return(false)
        put :update, {id: user.to_param, user: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {id: user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "displays a notice of success" do
      user = User.create! valid_attributes
      delete :destroy, {id: user.to_param}, valid_session
      expect(flash[:notice]).to match /successfully deleted/
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, {id: user.to_param}, valid_session
      expect(response).to redirect_to(users_url)
    end
  end

end
