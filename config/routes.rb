Juventude::Application.routes.draw do
  resources :temas


  resources :filtros


  resources :dados

  root :to => 'dados#index'
end
