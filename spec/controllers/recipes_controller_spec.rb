require 'spec_helper'

describe Api::RecipesController do 

  describe "POST #create" do
   
    it "creates a new recipe" do
      expect{
        post :create, recipe: create(:recipe)
      }.to change(Recipe, :count).by(1)
    end

    context "with invalid attributes" do
      it "does not save the recipe" do
        
      end
    end

  end

  describe "GET index with valid user" do
    it "has a 200 status code" do
      user = create(:user)
      login(user)
      get :index
      response.code.should eq("200")
    end
  end


  describe "GET #new" do
  end

  describe "GET #show" do
    it "renders the :show template"
  end
end