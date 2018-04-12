Rails.application.routes.draw do
  root 'welcome#index'

  resources :books do
    put :rating, on: :member
    resources :reviews, only: [:create, :destroy]
  end

  get 'top-10-books', to: 'books#best_books'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
