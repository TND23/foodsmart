GroceryApp::Application.routes.draw do
  root to: "static_pages#root"

  namespace :api, :defaults => {:format => :json} do

    resources :cookbooks, :only => [:show, :index] do
      resources :cookbook_recipes, :only => [:index]
    end
 
    resources :cookbook_recipes, :only => [:create, :update, :destroy, :show]

    resources :recipes do
      resources :cookbook_recipes, :only => [:new]
    	resources :endorsements, :only => [:index, :create, :show, :destroy, :update]
      resources :recipe_ingredients, :except => [:edit]
      resources :recipe_utensils, :except => [:edit, :show]
    end

    resource :session, :only => [:create, :new, :destroy]
    resources :ingredients, :except => [:destroy, :update]
    resources :utensils, :only => [:create, :show, :update]

    resources :users, :except => [:update, :index] do
      resources :cookbooks, :only => [:new]
      resources :user_ingredients, :only => [:index, :create, :destroy, :new]
    end

  end
end