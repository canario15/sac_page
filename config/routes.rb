SacPage::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root :to => "pages#home"

  get  '/descargar' => 'application#download', as: :download

  get '/noticias' => 'pages#news', as: :news
  get '/noticias/:id' => 'pages#notice', as: :notice
  get '/categorias' => 'pages#categories', as: :categories
  get '/galeria' => 'pages#galleries', as: :galleries
  get '/nosotros' => 'pages#about', as: :about
  get '/contacto' => 'pages#contact', as: :contact

  post 'send_contact_info' => 'pages#send_contact_info', as: :send_contact_info

  get 'categorias/formula_sac' => 'categories#formula_sac', as: :formula_sac
  get 'categorias/formula_sac/campeonato' => 'categories#championship_formula_sac', as: :championship_formula_sac
  get 'categorias/formula_sac/galeria' => 'categories#gallery_formula_sac', as: :gallery_formula_sac
  get 'categorias/formula_sac/pilotos' => 'categories#pilots_formula_sac', as: :pilots_formula_sac
  get 'categorias/formula_sac/reglamentos' => 'categories#regulation_formula_sac', as: :regulation_formula_sac
  get 'categorias/turismo_pista_sac' => 'categories#turismo_pista_sac', as: :turismo_pista_sac
  get 'categorias/turismo_pista_sac/campeonato' => 'categories#championship_turismo_pista_sac', as: :championship_turismo_pista_sac
  get 'categorias/turismo_pista_sac/galeria' => 'categories#gallery_turismo_pista_sac', as: :gallery_turismo_pista_sac
  get 'categorias/turismo_pista_sac/pilotos' => 'categories#pilots_turismo_pista_sac', as: :pilots_turismo_pista_sac
  get 'categorias/turismo_pista_sac/reglamentos' => 'categories#regulation_turismo_pista_sac', as: :regulation_turismo_pista_sac
  get "categorias/turismo_pista_sac/reglamentos/download_pdf"
  get 'categorias/karting_125' => 'categories#karting_125', as: :karting_125
  get 'categorias/karting_125/campeonato' => 'categories#championship_karting_125', as: :championship_karting_125
  get 'categorias/karting_125/galeria' => 'categories#gallery_karting_125', as: :gallery_karting_125
  get 'categorias/karting_125/pilotos' => 'categories#pilots_karting_125', as: :pilots_karting_125
  get 'categorias/karting_125/reglamentos' => 'categories#regulation_karting_125', as: :regulation_karting_125



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
