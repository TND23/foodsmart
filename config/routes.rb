GroceryApp::Application.routes.draw do

  root to: "root#index"

  resources :users do
    resources :cookbook
  end

  resources :recipes do
  	resources :endorsements
  end

  resource :session
  resources :ingredients
  resources :utensils

end
