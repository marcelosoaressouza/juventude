Juventude::Application.routes.draw do
  resources :temas
  resources :filtros
  resources :dados do
    collection do
      get 'temas'
    end
  end

  root :to => 'dados#index'
end
