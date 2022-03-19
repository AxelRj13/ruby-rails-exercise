Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # <<URL>>/rails/info/routes -> untuk menampilkan list route yang sudah dibuat

  get '/home', to: 'home#index'
  get '/halo/:id', to: 'home#halo'

  resources :books do
    get :active, on: :collection
    patch :toggle, on: :member #berlaku untuk 1 record / data saja
  end
  # resources :books, only: [:index, :show]
  # resources :books, except: [:create, :edit, :new, :update, :destroy]
end
