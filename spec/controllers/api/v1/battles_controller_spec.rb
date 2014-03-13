require 'spec_helper'

describe Api::V1::BattlesController, :type => :request do
  render_views

  let!(:user) { FactoryGirl.create(:user) }
  let!(:war)  { FactoryGirl.create(:war, :owner_id => user.id) }
  let!(:new_battle) {
    {
      :notes   => "21-15",
      :user_id => user.id,
      :war_id  => war.id
    }
  }

  context "#create" do

    before { post :create, :war_id => war.id, :user_id => user.id, :battle => new_battle }

    it "responds with a 201 upon sucessful create" do
      response.status.should eq(201)
    end

  end

end
