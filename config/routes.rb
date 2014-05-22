Juventude::Application.routes.draw do
  resources :temas
  resources :filtros
  resources :pnads do
    collection do
      get 'temas'
    end
  end

  root :to => 'pnads#index'
end
