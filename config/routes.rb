Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    namespace :api do
      namespace :v1 do
        get "/merchants/find_all", to: 'merchant_find#index'
        get "/merchants/find", to: 'merchant_find#show'
        # get "/items/find_all", to: 'items_find#index'
      end
    end

    namespace :api do
      namespace :v1 do
        get '/merchants/most_revenue', to: 'merchants_bi#index'
        get '/merchants/most_items', to: 'merchants_bi#show'
      end
    end

    namespace :api do
      namespace :v1 do
        get "/items/find_all", to: 'items_find#index'
        get "/items/find", to: 'items_find#show'
      end
    end

    namespace :api do
      namespace :v1 do
        resources :merchants, except: [:new, :edit]
      end
    end

    namespace :api do
      namespace :v1 do
        resources :items, except: [:new, :edit]
      end
    end

    namespace :api do
      namespace :v1 do
        get "/merchants/:id/items", to: "merchant_items#index"
        get "/items/:id/merchant", to: "item_merchants#index"
      end
    end


  end
