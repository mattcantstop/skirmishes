require 'spec_helper'

describe Api::V1::SessionsController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:user_for_authentication) {
    {
      "username" => user.username,
      "password" => user.password
    }
  }

  context "#create" do

    it "returns a 200 response when session is created" do
      post :create, user_for_authentication
      response.status.should eq(200)
    end
  end

end
