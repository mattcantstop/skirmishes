require 'spec_helper'

describe Api::V1::UsersController, :type => :request do

  let!(:new_user) {
    { :user => {
              :first_name => "Matthew",
              :last_name  => "Duff",
              :username   => "mattcantstop",
              :email      => "matthewlduff@gmail.com",
              :password   => "encrypted"
      } }
    }
  let!(:user) { FactoryGirl.create(:user) }

  context "showing a user" do
    it "returns a user when credentials are valid" do
      get :show, :id => user.id, format: :json
      expect(response.status).to eq 200
    end
  end

  context "creating a user" do
    it "creates a user successfully with good params" do
      post :create, new_user
      response.body.should eql(new_user.to_json)
    end
  end

end
