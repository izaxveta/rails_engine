# README - Rails Engine
Iza Jimenez and Aaron Schreck collaborated to create this project, as a part of their education at the Turing School of Software and Design. The primary learning goal of Rales Engine was to create a RESTful API using the Ruby on Rails framework. During this project, we had the opportunity to pursue advanced Active Record queries, construct filters and serializers, and build a series of controllers using only show and index routes.

The project sources its data from a number of CSV files that are included in the repo.


Steps to Implement the Rales Engine:

# Database population:
```
bundle

rake db:create
rake db:migrate
rake csv_import:all
```

# How to run the test suite:
```
rspec
```

#Launching and interacting with the server
To run server and launch queries,
rails s

## Routes


| Customers |
---|---|---
Description | Verb | Path
returns a collection of all customers  | GET |  /api/v1/customers
returns a single object representation   | GET |  /api/v1/customers/find?=`query`
returns all matches for the given query  | GET |  /api/v1/customers/find_all?=`query`
returns a single customer  | GET |  /api/v1/customers/`:id`
returns a merchant where the customer has conducted the most successful transactions   | GET |  /api/v1/customers/`:customer_id`/favorite_merchant
returns a collection of associated invoices  | GET |  /api/v1/customers/`:customer_id`/invoices
returns a collection of associated transactions  | GET |  /api/v1/customers/`:customer_id`/transactions

| Merchants |
---|---|---
Description | Verb | Path
returns a collection of all merchants  | GET |  /api/v1/merchants
returns a single object representation   | GET |  /api/v1/merchants/find?=`query`
returns all matches for the given query  | GET |  /api/v1/merchants/find_all?=`query`
returns the total revenue for date x across all merchants  | GET |  /api/v1/merchants/revenue
returns the top x merchants ranked by total revenue   | GET |  /api/v1/merchants/most_revenue
returns the top x merchants ranked by total number of items sold   | GET |  /api/v1/merchants/most_items
returns a single merchant  | GET |  /api/v1/merchants/`:id`
returns the customer who has conducted the most total number of successful transactions   | GET |  /api/v1/merchants/`:id`/favorite_customer
returns the total revenue for that merchant across successful transactions   | GET |  /api/v1/merchants/`:merchant_id`/revenue
returns a collection of items associated with that merchant   | GET |  /api/v1/merchants/`:merchant_id`/items
returns a collection of invoices associated with that merchant from their known orders   | GET |  /api/v1/merchants/`:merchant_id`/invoices

| Items |
---|---|---
Description | Verb | Path
returns a collection of all items  | GET |  /api/v1/items
returns a single item  | GET |  /api/v1/items/`:id`
returns a single object representation   | GET |  /api/v1/items/find?=`query`
returns all matches for the given query  | GET |  /api/v1/items/find_all?=`query`
returns the top x items ranked by total revenue generated  | GET |  /api/v1/items/most_revenue
returns the top x item instances ranked by total number sold   | GET |  /api/v1/items/most_items
returns the associated merchant  | GET |  /api/v1/items/`:item_id`/merchant
returns the date with the most sales for the given item using the invoice date   | GET |  /api/v1/items/`:item_id`/best_day
returns a collection of associated invoice items   | GET |  /api/v1/items/`:item_id`/invoice_items

| Invoices |
---|---|---
Description | Verb | Path
returns a collection of all invoices   | GET |  /api/v1/invoices
returns a single object representation   | GET |  /api/v1/invoices/find?=`query`
returns all matches for the given query  | GET |  /api/v1/invoices/find_all?=`query`
returns a single invoice   | GET |  /api/v1/invoices/`:id`
returns a collection of associated transactions  | GET |  /api/v1/invoices/`:invoice_id`/transactions
returns a collection of associated invoice items   | GET |  /api/v1/invoices/`:invoice_id`/invoice_items
returns a collection of associated items   | GET |  /api/v1/invoices/`:invoice_id`/items
returns the associated customer  | GET |  /api/v1/invoices/`:invoice_id`/customer
returns the associated merchant  | GET |  /api/v1/invoices/`:invoice_id`/merchant

| Invoice Items |
---|---|---
Description | Verb | Path
returns a collectionn of all invoice items   | GET |  /api/v1/invoice_items
returns a single invoice item  | GET |  /api/v1/invoice_items/`:id`
returns a single object representation   | GET |  /api/v1/invoice_items/find?=`query`
returns all matches for the given query  | GET |  /api/v1/invoice_items/find_all?=`query`
returns the associated invoice   | GET |  /api/v1/invoice_items/`:invoice_item_id`/invoice
returns the associated item  | GET |  /api/v1/invoice_items/`:invoice_item_id`/item

| Transactions |
---|---|---
Description | Verb | Path
returns a collection of all transactions   | GET |  /api/v1/transactions
returns a single transaction   | GET |  /api/v1/transactions/`:id`
returns a single object representation   | GET |  /api/v1/transactions/find?=`query`
returns all matches for the given query  | GET |  /api/v1/transactions/find_all?=`query`
returns the associated invoice   | GET |  /api/v1/transactions/`:transaction_id`/invoice
