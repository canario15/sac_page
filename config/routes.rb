SacPage::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root :to => "pages#home"

  post '/close_race'                                  => 'application#close_race',                   as: :close_race

  get '/noticias'                                     => 'pages#news',                              as: :news
  get '/noticias/:id'                                 => 'pages#notice',                            as: :notice

  get '/categorias'                                   => 'pages#categories',                        as: :categories
  get '/categorias/:id'                               => 'categories#show',                         as: :category
  get '/categorias/:id/campeonatos'                   => 'categories#show_championships',           as: :category_championships

  get '/categorias/:category_id/circuitos'            => 'circuits#index',                          as: :circuits
  get '/categorias/:category_id/circuitos/:id'        => 'circuits#show',                           as: :show_circuit

  get '/categorias/:category_id/pilotos'              => 'categories#show_pilots',                  as: :category_pilots
  get '/categorias/:category_id/pilotos/:id'          => 'categories#pilot',                        as: :pilot

  get '/categorias/:category_id/galerias'             => 'categories#show_gallery',                 as: :category_gallery
  get '/categorias/:category_id/galerias/:id'          => 'categories#show_albun',                   as: :category_gallery_albun
  get '/categorias/:id/reglamentos'                   => 'categories#show_regulation',              as: :category_regulation

  get '/galeria'                                      => 'pages#galleries',                         as: :galleries

  get '/nosotros'                                     => 'pages#about',                             as: :about

  get '/contacto'                                     => 'pages#contact',                           as: :contact
  post 'send_contact_info'                            => 'pages#send_contact_info',                 as: :send_contact_info

  get "/championship_by_year"                         => 'categories#championship_by_year',         as: :championship_by_year
  get "/championship_query"                           => 'categories#championship_query',           as: :championship_query

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
