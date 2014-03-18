require "spec_helper"

describe Api::UsersController do
  
	describe "POST #create" do
			name = (0..8).map{ (65 + rand(26)).chr }.join
			user = FactoryGirl.build(:user, :username => name, :password => 123456)
			user.reset_session_token
    it "responds successfully with an HTTP 200 status code" do
    	#random name
    
      post :create, :user => {:username => name, :password => 123456 }
      

      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end
	
end