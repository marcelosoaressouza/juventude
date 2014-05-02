Juventude::Application.routes.draw do
  resources :dados

  root :to => 'dados#index'
end
