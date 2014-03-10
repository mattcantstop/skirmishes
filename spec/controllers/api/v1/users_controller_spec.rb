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
        :password   => "encrypted",
        :password_confirmation => "encrypted"
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

  let!(:disabled_user) { FactoryGirl.create(:user, is_disabled: true, email: "disabledemail@gmail.com", username: "disabledusername") }

  context "#show" do

    it "returns a user when credentials are valid" do
      get :show, :id => existing_user.id, format: :json
      expect(response.status).to eq 200
    end

    it "returns status of 404 for disabled user" do
      get :show, :id => disabled_user.id
      response.status.should eq(404)
    end
  end

  context "#create" do

    before { post :create, new_user }

    it "creates a user successfully with good params" do
binding.pry
      response.status.should eql(201)
    end

    it "has the correct attributes returned" do
      assert_equal ["id", "first_name","last_name","email","username","authentication_token"], JSON.parse(response.body)["user"].keys
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

  context "#delete" do
    before { delete :destroy, :id => existing_user.id }

    it "changes the status of the user to disabled" do
      response.status.should eq(204)
    end

  end

end
