Rails.application.routes.draw do
  resources :answers
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
