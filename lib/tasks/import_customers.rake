namespace :csv_import do

#  desc "populate merchants from CSV"
  
  
  desc "import from CSV"
  
  task import_merchants: :environment do
    puts "Importing merchants from csv in #{Rails.env} environment"
    Merchant.copy_from "db/data/merchants.csv",
    map: {
      'id' => 'id',
      'name' => 'name',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'
    }
  end 

  task import_customers: :environment do
    puts "Importing customers from csv in #{Rails.env} environment"
    Customer.copy_from "db/data/customers.csv",
    map: {
      'id' => 'id',
      'first_name' => 'first_name',
      'last_name' => 'last_name',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'
    }
  end 

  task import_items: :environment do
    puts "Importing Items from csv in #{Rails.env} environment"
    Item.copy_from "db/data/items.csv",
    map: {
      'id' => 'id',
      'name' => 'name',
      'description' => 'description',
      'unit_price' => 'unit_price',
      'merchant_id' => 'merchant_id',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'
    }
  end 
  
  task import_invoices: :environment do
    puts "Importing Invoices from csv in #{Rails.env} environment"
    Invoice.copy_from "db/data/invoices.csv",
    map: {
      'id' => 'id',
      'customer_id' => 'customer_id',
      'merchant_id' => 'merchant_id',
      'status' => 'status',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'
    }
  end 
  
  task import_invoice_items: :environment do
    puts "Importing Invoice Items from csv in #{Rails.env} environment"
    InvoiceItem.copy_from "db/data/invoice_items.csv",
    map: {
      'id' => 'id',
      'item_id' => 'item_id',
      'invoice_id' => 'invoice_id',
      'quantity' => 'quantity',
      'unit_price' => 'unit_price',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'
    }
  end 
  
  task import_transactions: :environment do
    puts "Importing Transactions from csv in #{Rails.env} environment"
    Transaction.copy_from "db/data/transactions.csv",
    map: {
      'id' => 'id',
      'invoice_id' => 'invoice_id',
      'credit_card_number' => 'credit_card_number',
      'credit_card_expiration_date' => 'credit_card_expiration_date',
      'result' => 'result',
      'created_at' => 'created_at',
      'updated_at' => 'updated_at'
    }
  end 

  desc "populate all tables"
  task all: [:merchants, :customers, :items, :invoices, :invoiceitems, :transactions]
end 