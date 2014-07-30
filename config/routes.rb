Juventude::Application.routes.draw do

  resources :agendas
  resources :pnads
  resources :dados
  resources :temas
  resources :indicadors, :path => :indicadores

  root :to => 'dados#index'
end
