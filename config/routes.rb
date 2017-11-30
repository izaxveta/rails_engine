Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    namespace :merchants do
      resources :revenue,      only: [:index], to: 'revenue#index'
      resources :most_revenue, only: [:index], to: 'most_revenue#index'
      resources :most_items,   only: [:index], to: 'most_items#index'
      resources :find,         only: [:index]
      resources :find_all,     only: [:index]
    end

    namespace :invoices do
      resources :find,     only: [:index]
      resources :find_all, only: [:index]
    end

    namespace :invoice_items do
      resources :find,     only: [:index]
      resources :find_all, only: [:index]
    end

    namespace :customers do
      resources :find,              only: [:index]
      resources :find_all,          only: [:index]
    end
    
    namespace :transactions do
      resources :find,     only: [:index]
      resources :find_all, only: [:index]
    end
    
    namespace :items do
      resources :find,         only: [:index]
      resources :find_all,     only: [:index]
      resources :most_revenue, only: [:index], to: 'most_revenue#index'
      resources :most_items,   only: [:index], to: 'most_items#index'

    end
    
    resources :merchants,       only: [:index, :show] do
      resources :revenue,       only: [:index], to: 'merchants/revenue#index'
      resources :items,         only: [:index], to: 'merchants/items#index'
      resources :invoices,      only: [:index], to: 'merchants/invoices#index'
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
      resources :customer,      only: [:show], to: 'invoices/customers#show'
      resources :merchant,      only: [:show], to: 'invoices/merchants#show'
    end

    resources :invoice_items,   only: [:index, :show] do
      resources :invoices,      only: [:show], to: 'invoice_items/invoices#show'
      resources :item,          only: [:show], to: "invoice_items/items#show"
    end

    resources :items,           only: [:index, :show] do
      resources :best_day,      only: [:index], to: "items/best_day#index"
    end 
  end
end

# get '/api/v1/merchants/:id/revenue', to: 'api/v1/merchants/revenue#show'
# get "/api/v1/merchants/:id/customers_with_pending_invoices", to: 'api/v1/analytics#customers_with_pending_invoices'

end
