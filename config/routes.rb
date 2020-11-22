Rails.application.routes.draw do
 root to: 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get    'book/post',     to: 'book#public_book'

  get    'book/new',      to: 'book#new_book'
  post   'book/new',      to: 'book#create_new_book'

  get    'book/:id',      to: 'book#show_book', as: "show_book_info"

  get    'book/:id/edit', to: 'book#edit_book', as: 'edit_book'
  post   'book/:id/edit', to: 'book#update_book'

  delete 'book/:id',      to: 'book#delete_book'

end
