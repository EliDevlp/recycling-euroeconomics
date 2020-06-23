Rails.application.routes.draw do

  root "sessions#new"
  post '/', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users do
    get "/analysis_show", to: "users#analysis_show"
    get "/analysis_edit", to: "users#analysis_edit"
    patch "/analysis_edit", to: "users#analysis_update"
    resources :bins, only: [:edit, :update, :destroy]
    patch "/users/:user_id/bins/:id", to: "bins#update"

  end
  get "/signup", to: "users#new"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
