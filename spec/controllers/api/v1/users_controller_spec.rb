require 'spec_helper'

describe Api::V1::UsersController, :type => :request do
  render_views

  let!(:existing_user) { FactoryGirl.create(:user) }

  let!(:user) { User.new(
    :first_name => "Matthew",
    :last_name  =>  "Duff",
    :password   => "encrypted",
    :username   => "mattcantstop#{Random.rand(11000)}",
    :email      => "matthewlduff#{Random.rand(10000)}@gmail.com"
  )}

  let!(:new_user) {
    { :user => {
        :first_name => "Matthew",
        :last_name  => "Duff",
        :username   => "mattcantstop#{Random.rand(11000)}",
        :email      => "matthewlduff#{Random.rand(10000)}@gmail.com",
        :password   => "encrypted"
        }
      }
    }

  let!(:user_attributes) {
    {
      'first_name' => new_user[:user][:first_name],
      'last_name'  => new_user[:user][:last_name],
      'email'      => new_user[:user][:email],
      'username'   => new_user[:user][:username]
    }
  }

  let!(:updated_user) {
    {
      'id'        => existing_user.id,
      'last_name' => "Updated"
    }
  }

  context "#show" do
    it "returns a user when credentials are valid" do
      get :show, :id => existing_user.id, format: :json
      expect(response.status).to eq 200
    end
  end

  context "#create" do

    before { post :create, new_user }

    it "creates a user successfully with good params" do
      response.status.should eql(201)
    end

    it "has the correct attributes returned" do
      assert_equal ["id", "first_name","last_name","email","username"], JSON.parse(response.body)["user"].keys
    end
  end

  context "#update" do

    before { put :update, :id => existing_user.id, :user => updated_user }

    it "updates when valid parameters are passed" do
      response.status.should eq(200)
    end

    it "updates the expected attributes" do
      JSON.parse(response.body)["user"]["last_name"].should eq(updated_user["last_name"])
    end

  end

end
