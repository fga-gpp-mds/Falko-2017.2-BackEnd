Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "authenticate", to: "authentication#authenticate"
  post "request_github_token", to: "users#request_github_token"
  get "users/:user_id/projects" => "projects#index"
  post "users/:user_id/projects" => "projects#create"

  resources :users
  resources :projects

  resources :users, shallow: true do
    resources :projects do
      resources :sprints
    end
  end

end
