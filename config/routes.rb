Juventude::Application.routes.draw do
  resources :dados
  resources :temas
  resources :filtros

  root :to => 'dados#index'
end
