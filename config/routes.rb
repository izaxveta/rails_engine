Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resources :revenue,      only: [:index], to: 'revenue#index'
        resources :most_revenue, only: [:index], to: 'most_revenue#index'
        resources :most_items,   only: [:index], to: 'most_items#index'
        resources :find,         only: [:index], to: 'find#index'
        resources :find_all,     only: [:index], to: "find_all#index"
        get "/:id/favorite_customer" => "favorite_customer#index"
      end

    namespace :invoices do
      resources :find,     only: [:index]
      resources :find_all, only: [:index]
    end

    namespace :invoice_items do
      get '/find' => "find#index"
      get "/find_all" => 'find_all#index'
    end

    namespace :customers do
      get '/find' => "find#index"
      get "/find_all" => 'find_all#index'
    end
    
    namespace :transactions do
      get '/find' => "find#index"
      get "/find_all" => 'find_all#index'
    end
    
    namespace :items do
      get '/find' => "find#index"
      get "/find_all" => 'find_all#index'
      resources :most_revenue, only: [:index], to: 'most_revenue#index'
      resources :most_items,   only: [:index], to: 'most_items#index'

    end
    
    resources :merchants,           only: [:index, :show] do
      resources :revenue,           only: [:index], to: 'merchants/revenue#index'
      resources :items,             only: [:index], to: 'merchants/items#index'
      resources :invoices,          only: [:index], to: 'merchants/invoices#index'
      # resources :favorite_customer, only: [:index], to: 'merchants/favorite_customer#index' 
		end
    
    resources :transactions,    only: [:index, :show] do
      resources :invoice,       only: [:index], to: "transactions/invoice#index"
    end
    
    resources :customers,         only: [:index, :show] do
      resources :favorite_merchant, only: [:index], to: 'customers/favorite_merchant#index'
      resources :invoices,        only: [:index], to: "customers/invoices#index"
      resources :transactions,    only: [:index], to: "customers/transactions#index"
    end
    
    resources :invoices,        only: [:index, :show] do
      resources :transactions,  only: [:index], to: 'invoices/transactions#index'
      resources :invoice_items, only: [:index], to: 'invoices/invoice_items#index'
      resources :items,         only: [:index], to: 'invoices/items#index'
      resources :customer,      only: [:index], to: 'invoices/customers#show'
      resources :merchant,      only: [:index], to: 'invoices/merchants#show'
    end

    resources :invoice_items,   only: [:index, :show] do
      resources :invoice,      only: [:index], to: 'invoice_items/invoices#index'
      resources :item,          only: [:index], to: "invoice_items/items#index"
    end

    resources :items,           only: [:index, :show] do
      resources :best_day,      only: [:index], to: "items/best_day#index"
      resources :invoice_items, only: [:index], to: "items/invoice_items#index"   
      resources :merchant,     only: [:index], to: "items/merchants#index"   
    end 
  end
end

end
