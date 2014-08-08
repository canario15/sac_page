SacPage::Application.routes.draw do

  root :to => "pages#home"

  get '/noticias' => 'pages#news', as: :news
  get '/categorias' => 'pages#categories', as: :categories
  get '/galeria' => 'pages#galleries', as: :galleries
  get '/nosotros' => 'pages#about', as: :about
  get '/contacto' => 'pages#contact', as: :contact

  post 'send_contact_info' => 'pages#send_contact_info', as: :send_contact_info

  get 'categories/formula_sac' => 'categories#formula_sac', as: :formula_sac
  get 'categories/turismo_pista_sac' => 'categories#turismo_pista_sac', as: :turismo_pista_sac
  get 'categories/karting_125' => 'categories#karting_125', as: :karting_125

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
