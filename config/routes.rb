GroceryApp::Application.routes.draw do

  root to: "root#index"

  resources :users, :except => [:index, :edit, :update] do
    resources :cookbook, :only => [:show]
  end

  #redo embedding
  resources :recipes do
    #remove create
  	resources :endorsements, :only => [:create, :show, :destroy]
  end

  resource :session, :only => [:create, :new, :destroy]
  resources :ingredients, :only => [:create, :new, :edit, :show]
  resources :utensils, :only => [:create, :new, :edit, :show]

end
