GroceryApp::Application.routes.draw do
  root to: "static_pages#root"

  namespace :api do

    resources :users, :except => [:edit, :update] do
      resources :cookbooks, :only => [:new, :show]
    end

    #redo embedding
    resources :recipes do
    	resources :endorsements, :only => [:create, :show, :destroy, :update]
    end

    resource :session, :only => [:create, :new, :destroy]
    resources :ingredients, :only => [:create, :new, :edit, :show, :index]
    resources :utensils, :only => [:create, :show, :update]
  end
end
