Juventude::Application.routes.draw do

  resources :dados do
    collection do
      get :fontes
    end
  end

  resources :temas
  resources :pnads,      :path => :pnad
  resources :agendas, :path => :agenda
  resources :indicadors, :path => :indicadores

  match '/:id' => "shortener/shortened_urls#show"

  root :to => 'dados#index'

end
