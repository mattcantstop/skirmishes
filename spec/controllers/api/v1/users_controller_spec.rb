require 'spec_helper'

describe "Users Controller" do 

  before do
    let!(:user) { FactoryGirl.create(:user) }
  end

  it "show" do
    get 
  end

end
