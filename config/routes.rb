Juventude::Application.routes.draw do
  resources :filtros


  resources :dados

  root :to => 'dados#index'
end
