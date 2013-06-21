require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      render text: 'Anonymous controller'
    end
  end

  it 'assigns current_user to @current_user' do
    current_user = FactoryGirl.create(:user)
    sign_in current_user
    get :index
    expect(assigns(:current_user)).to eq(current_user)
  end
end
