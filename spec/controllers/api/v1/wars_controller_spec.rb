require 'spec_helper'

describe Api::V1::WarsController, :type => :request do
  render_views

  let!(:user) { FactoryGirl.create(:user) }
  let!(:war)  { FactoryGirl.create(:war)  }

  context "#show" do

    it "returns 200 status when war is found" do
      get :show, :id => war.id, :user_id => user.id
      expect(response.status).to eq(200)
      puts @war
    end

  end
end
