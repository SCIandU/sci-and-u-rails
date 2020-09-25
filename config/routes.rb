Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }

  # api
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :health_resources, only: [:index, :show]
      resources :scripts_and_tips, only: [:index, :show]
      resources :surveys, only: [:index, :show]      
      resources :salon_events, only: [:index, :show]
      resources :users, only: [:show]     
      resources :sessions, only: [:create, :destroy]            
    end
  end

  resources :salon_events do
    resources :event_registrations
    get 'archive', on: :collection
  end

  resources :users do
    get 'coaches', on: :collection
    get 'experts', on: :collection
    get 'badge_administration', on: :collection   
    get 'resource_administration', on: :collection  
  end

  resources :surveys do
    post :mark, on: :member
    get :mark, on: :member    
  end

  resources :event_registrations
  resources :health_resources
  resources :surveys  
  resources :survey_questions    
  resources :reviews
  resources :sponsors
  resources :mars_ratings
  resources :intake_forms
  resources :basic_pages
  resources :blog_comments
  resources :stories
  resources :questions
  resources :ratings, only: :update
  resources :scripts_and_tips
  resources :problems
  resources :solution_categories

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :health_resources, only: [:new, :create, :show, :edit, :update] do
    resources :reviews
  end
  resources :departments, only: [:new, :create, :show, :edit, :update] do
    resources :health_resources
  end

  resources :blog_posts, only: [:new, :create, :show, :edit, :update, :index] do
    resources :blog_comments
  end

  post '/blog_posts/:blog_post_id/blog_comments', to: 'blog_comments#create', as: 'create_blog_post_blog_comment'
  post '/salon_events/:salon_event_id/event_registrations', to: 'event_registrations#create', as: 'create_salon_event_registration'

  get '/event_registrations/you_are_registered'
  get '/event_registrations/sorry'

  post 'favorite/:id', to: 'health_resources#favorite', as: :favorite_resource
  post 'badge_administration/add_badges', to: 'users#add_badges', as: :add_badges
  post 'resource_administration/add_resources', to: 'users#add_resources', as: :add_resources

  get '/home/index'
  get '/home/about'
  get '/home/thank_you'
  get '/home/mars_thanks'
  get '/home/mars_will_contact'
  get '/home/search'
  get '/home/rest'
  get 'feed' => 'home#feed'
  get 'coaching' => 'home#coaching'
  get 'coachportal' => 'home#coachportal'
  get '/home/forgot_password' => 'home#forgot_password'
  post '/home/generate_new_password_email' => 'home#generate_new_password_email'
  get '/home/password_reset_email' => 'home#password_reset_email'

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  get '/contacts/coachform'
  get '/contacts/feedback'

  get '/contacts/mars_thanks'
  get '/contacts/mars_help'

  root to: 'home#index'

  # get 'health_resources_json' => 'home#health_resource_feed'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
<<<<<<< Updated upstream
  #   end
=======
  #   end 
  
  mount EmrEngine::Engine => "/saage"
>>>>>>> Stashed changes

end
