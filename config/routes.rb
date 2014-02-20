GroceryApp::Application.routes.draw do

  root to: "root#index"

  resources :users do
    resources :foods
    resources :groceries
  end
  resource :session
  resources :recipes

end
