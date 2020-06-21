Rails.application.routes.draw do
  resources :users do
    get "/analysis_new", to: "users#analysis_new"
    post "/analysis_new", to: "users#analysis_create"
    get "/analysis_show", to: "users#analysis_show"
    get "/analysis_edit", to: "users#analysis_edit"
    patch "/analysis_edit", to: "users#analysis_update"
  end

  root "users#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
