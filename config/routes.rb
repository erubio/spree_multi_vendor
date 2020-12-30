Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :vendors do
      collection do
        post :update_positions
      end
    end
    get 'vendor_settings' => 'vendor_settings#edit'
    patch 'vendor_settings' => 'vendor_settings#update'
  end
end
Spree::Core::Engine.add_routes do
  resources :vendors
  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        resources :vendors do
          resources :vendors, only: [:index, :show]
          get 'products' => 'vendors_products#index'
        end
      end
    end
  end
end
