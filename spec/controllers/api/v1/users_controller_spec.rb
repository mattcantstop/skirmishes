require 'spec_helper'

describe Api::V1::UsersController, :type => :request do
  render_views

  let!(:new_user) {
    { :user => {
              :first_name => "Matthew",
              :last_name  => "Duff",
              :username   => "mattcantstop#{Random.rand(11000)}",
              :email      => "matthewlduff#{Random.rand(10000)}@gmail.com",
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
      response.status.should eql(201)
    end
  end

end
