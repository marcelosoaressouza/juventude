Juventude::Application.routes.draw do

  resources :agendas
  resources :pnads, :path => :pnad
  resources :dados
  resources :temas
  resources :indicadors, :path => :indicadores

  root :to => 'dados#index'
end
