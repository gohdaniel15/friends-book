Rails.application.routes.draw do
  root to: 'friends#index'
  
  resources :friends do
    post 'import_csv', on: :collection
  end
end
