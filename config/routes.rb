Rails.application.routes.draw do
  root "tasks#index"

  resources :tasks do
    collection do
      get :progress
      get :done
    end
  end
end
