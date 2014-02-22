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
  let!(:user_attributes) {
    {
      'first_name' => new_user[:user][:first_name],
      'last_name'  => new_user[:user][:last_name],
      'email'      => new_user[:user][:email],
      'username'   => new_user[:user][:username]
    }
  }
  let!(:user) { FactoryGirl.create(:user) }

  context "showing a user" do
    it "returns a user when credentials are valid" do
      get :show, :id => user.id, format: :json
      expect(response.status).to eq 200
    end
  end

  context "creating a user" do

    before do
      post :create, new_user
    end

    it "creates a user successfully with good params" do
      response.status.should eql(201)
    end

    it "has the correct attributes returned" do
      expect(JSON.parse(response.body)).to eq(User.new(user_attributes))
    end
  end

end
