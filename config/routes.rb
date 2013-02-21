Teaurn::Application.routes.draw do
  resources :boys
  resources :phrases do
    collection do
      get :partial
    end
  end
end
