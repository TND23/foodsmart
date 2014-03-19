require "spec_helper"

describe Api::UsersController do
  
	describe "POST #create" do
	  	#random name
			name = (0..8).map{ (65 + rand(26)).chr }.join
			user = FactoryGirl.build(:user, :username => name, :password => 123456)
			user.reset_session_token
   
    it "responds successfully with an HTTP 200 status code" do
      post :create, :user => { :username => name, :password => 123456 }

      expect(response).to be_success
      expect(response).not_to be_redirect
      expect(response.status).to eq(200)
    end

    it "adds a user to the record" do
    	name1 = (0..8).map{ (65 + rand(26)).chr }.join
      expect{
      	post :create, :user => { :username => name1, :password => 123456 } 
    	}.to change{User.count}.by(1)
    end

    it "does not add a duplicate user" do
      expect{
      	post :create, :user => { :username => name, :password => 123456 } 
    	}.to_not change{User.count}
    end

    it "renders the correct template" do
    	response.should redirect_to api_user_url
    end

    context "with invalid attributes" do
      it "does not save the user" do
        expect{
          post :create, :user => FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User,:count)
      end
    end

  end

  describe "GET #new" do
    it "renders the :new template"
  end

  describe "GET #show" do
    it "renders the :show template"
  end

  describe "DELETE #destroy" do

      #random name
      name = (0..8).map{ (65 + rand(26)).chr }.join
      user = FactoryGirl.build(:user, :username => name, :password => 123456)
      user.reset_session_token

  	it "destroys the user" do
	  	expect{
	  		delete :destroy, :user => FactoryGirl.attributes_for(:user)
	  	}.to change{User.count}.by(1)
  	end

  	it "destroys user dependency cookbook" do
  		#create a user with the controller (name must be unique)
  		name2 = (0..8).map{ (65 + rand(26)).chr }.join
      post :create, :user => { :username => name2, :password => 123456 }
  		expect{
	  		delete :destroy, :user => { :username => name2, :password => 123456 }
	  	}.to change{Cookbook.count}.by(1)
  	end

  	it "destroys user dependency endorsement" do
  		#create a user with the controller (name must be unique)
  		name3 = (0..8).map{ (65 + rand(26)).chr }.join
      post :create, :user => { :username => name3, :password => 123456 }

 			endorsement = FactoryGirl.build(
				:endorsement, 
				:comments => "Nice",
				:stars => 5,
				:user_id => user.id,
				:recipe_id => 3
			)
			expect{
	  		delete :destroy, :user => { :username => name2, :password => 123456 }
	  	}.to change{Endorsement.count}.by(1)	
  	end

  end
	
end