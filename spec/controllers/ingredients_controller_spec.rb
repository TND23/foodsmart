require 'spec_helper'

describe Api::IngredientsController do

  describe "POST #create" do
   
    it "responds successfully with an HTTP 200 status code" 

    it "adds an ingredient to the record" 

    it "does not add a duplicate ingredient" 

    it "renders the correct template" 

    context "with invalid attributes" do
      it "does not save the ingredient"
    end

  end

  describe "GET #new" do
    it "renders the :new template"
    it "adds an ingredient to the users ingredients"
  end

  describe "GET #show" do
    it "renders the :show template"
    it "shows the current users ingredients"
    it "responds to addition of ingredients"
    it "responds to removal of ingredients"
  end

end