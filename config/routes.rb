Juventude::Application.routes.draw do

  resources :agendas
  resources :pnads
  resources :dados
  resources :temas
  resources :filtros

  root :to => 'dados#index'
end
