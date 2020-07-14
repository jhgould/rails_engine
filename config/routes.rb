Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    namespace :api do
      namespace :v1 do
        get "/merchants/find_all", to: 'merchant_find#index'
        # merchants/find_all?name=ILL')
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
