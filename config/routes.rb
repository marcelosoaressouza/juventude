Juventude::Application.routes.draw do

  resources :agendas

  resources :dados do
    collection do
      get :fontes
    end
  end

  resources :temas
  resources :pnads,      :path => :pnad
  resources :indicadors, :path => :indicadores

  root :to => 'dados#index'
end
