require 'spec_helper'

describe Api::V1::UsersController do

  let!(:user) { FactoryGirl.create(:user) }

  it "returns a user when credentials are valid" do
    get :show, :id => user.id, format: :json
    expect(response.status).to eq 200
  end

end
