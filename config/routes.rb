GroceryApp::Application.routes.draw do
  root to: "static_pages#root"


#:defaults => {:format => :json}
  namespace :api, :defaults => {:format => :json} do
    
    resources :users, :except => [:update, :index] do
      resources :cookbooks, :only => [:new, :show]
      resources :user_ingredients, :only => [:index, :create, :destroy, :new]
    end

    #redo embedding
    resources :recipes do
    	resources :endorsements, :only => [:index, :create, :show, :destroy, :update]
    end

    resource :session, :only => [:create, :new, :destroy]
    resources :ingredients, :except => [:destroy, :update]
    resources :utensils, :only => [:create, :show, :update]
  end
end
