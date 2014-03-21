require 'spec_helper'

describe Api::V1::WarsController, :type => :request do
  render_views

  let!(:user) { FactoryGirl.create(:user) }
  let!(:war)  { FactoryGirl.create(:war, :owner_id => user.id)  }
  let!(:new_war) {
    {
      :name              => "Horse",
      :is_private        => false,
      :open_registration => false,
      :ending_score      => 10,
      :booty             => "$10",
      :owner_id          => user.id
    }
  }
  let!(:updated_war) {
    {
      :name => "Updated Warz"
    }
  }

  let!(:deleted_war) { 
    {
      :is_disabled => true
    }
  }


  context "#show" do

    it "returns 200 status when war is found" do
      get :show, :id => war.id, :user_id => user.id
      expect(response.status).to eq(200)
      puts @war
    end
  end

  context "#create" do

    before { post :create, :user_id => user.id, :war => new_war }

    it "returns a 201 status when a war is created" do
      expect(response.status).to eq(201)
    end
  end

  context "#update" do

    before { put :update, :id => war.id, :user_id => user.id, :war => updated_war }

    it "returns a 200 response" do
      expect(response.status).to eq(200)
    end

    it "has an updated name" do
      JSON.parse(response.body)["war"]["name"].should eq(updated_war[:name])
    end

  end

  context "#destroy" do

    before { delete :destroy, :id => war.id, :user_id => user.id, :war => deleted_war }

    it "returns a 204 status on delete" do
      expect(response.status).to eq(204)
    end

  end

  context "#join" do

    let!(:joining_user) { FactoryGirl.create(:user, :email => "onehotmess@gmail.com", :username => "secondhotmess") }

    before do
      post :join, :war_id => war.id, :user_id => joining_user.id
    end

    it "responds with a 200 upon successfully joining a war" do

      expect(response.status).to eq(200)
    end

  end

end




