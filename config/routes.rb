Rails.application.routes.draw do
 devise_for :users, controllers: { registrations: "registrations"}
 resources :todos

 devise_scope :user do
  authenticated :user do
    root :to => 'todos#index'
  end
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end
 end
end