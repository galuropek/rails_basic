Rails.application.routes.draw do
  resources :tests do
    resources :questions
  end
end
