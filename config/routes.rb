Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :merchants,       only: [:index, :show] do
      resources :items,         only: [:index], to: 'merchants/items#index'         
      resources :invoices,      only: [:index], to: 'merchants/invoices#index' 
		end 
			
    resources :transactions,    only: [:index, :show] do 
      resources :invoices,      only: [:show], to: "transactions/invoices#show"
    end 
   
    resources :customers,         only: [:index, :show] do
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
    
    
    resources :items,           only: [:index, :show]
  end
end

get '/api/v1/merchants/:id/revenue', to: 'api/v1/merchants/revenue#show'
# get "/api/v1/merchants/:id/customers_with_pending_invoices", to: 'api/v1/analytics#customers_with_pending_invoices'

end
