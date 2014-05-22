Juventude::Application.routes.draw do
  resources :temas do
    collection do
      get 'admin'
    end
  end

  resources :pnads do
    collection do
      get 'temas'
    end
  end

  resources :filtros

  root :to => 'temas#index'
end
