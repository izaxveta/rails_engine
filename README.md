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

# Launching and interacting with the server

To run server and launch queries:
```
rails s
```

## Routes


| Customers |
| --- |
| **Returns a collection of all customes** |
| */api/v1/customers* |
| **Returns a single object representation** |
| */api/v1/customers/find?=`(query)`* |
| **Returns all matches for the given query** |
| */api/v1/customers/find_all?=`(query)`* |
| **Returns a single customer** |
| */api/v1/customers/`:id`* |
| **Returns a merchant where the customer has conducted the most successful transactions** |
| */api/v1/customers/`:customer_id`/favorite_merchant* |
| **Returns a collection of associated invoice** |
| */api/v1/customers/`:customer_id`/invoices* |
| **Returns a collection of associated transaction** |
| */api/v1/customers/`:customer_id`/transactions* |


| Merchants |
| --- |
| **Returns a collection of all merchants** |
| */api/v1/merchants* |
| **Returns a single object representation** |
| */api/v1/merchants/find?=`(query)`* |
| **Returns all matches for the given query** |
| */api/v1/merchants/find_all?=`(query)`* |
| **Returns the total revenue for date x across all merchants** |
| */api/v1/merchants/revenue* |
| **Returns the top x merchants ranked by total revenue** |
| */api/v1/merchants/most_revenue* |
| **Returns the top x merchants ranked by total number of items sold** |
| */api/v1/merchants/most_items* |
| **Returns a single merchant** |
| */api/v1/merchants/`:id`* |
| **Returns the customer who has conducted the most total number of successful transactions** |
| */api/v1/merchants/`:id`/favorite_customer* |
| **Returns the total revenue for that merchant across successful transactions** |
| */api/v1/merchants/`:merchant_id`/revenue* |
| **Returns a collection of items associated with that merchant** |
| */api/v1/merchants/`:merchant_id`/items* |
| **Returns a collection of invoices associated with that merchant from their known orders** |
| */api/v1/merchants/`:merchant_id`/invoices* |


| Items |
| --- |
| **Returns a collection of all items** |
|*/api/v1/items* |
| **Returns a single item** |
| */api/v1/items/`:id`* |
| **Returns a single object representation** |
| */api/v1/items/find?=`(query)`* |
| **Returns all matches for the given query** |
| */api/v1/items/find_all?=`(query)`* |
| **Returns the top x items ranked by total revenue generated** |
| */api/v1/items/most_revenue* |
| **Returns the top x item instances ranked by total number sold** |
| */api/v1/items/most_items* |
| **Returns the associated merchant** |
| */api/v1/items/`:item_id`/merchant* |
| **Returns the date with the most sales for the given item using the invoice date** |
| */api/v1/items/`:item_id`/best_day* |
| **Returns a collection of associated invoice items** |
| */api/v1/items/`:item_id`/invoice_items* |


| Invoices |
| --- |
| **Returns a collection of all invoices** |
| */api/v1/invoices* |
| **Returns a single object representation** |
| */api/v1/invoices/find?=`(query)`* |
| **Returns all matches for the given query** |
| */api/v1/invoices/find_all?=`(query)`* |
| **Returns a single invoice** |
| */api/v1/invoices/`:id`* |
| **Returns a collection of associated transactions** |
| */api/v1/invoices/`:invoice_id`/transactions* |
| **Returns a collection of associated invoice items** |
| */api/v1/invoices/`:invoice_id`/invoice_items* |
| **Returns a collection of associated items** |
| */api/v1/invoices/`:invoice_id`/items* |
| **Returns the associated customet** |
| */api/v1/invoices/`:invoice_id`/customer* |
| **Returns the associated merchant** |
| */api/v1/invoices/`:invoice_id`/merchant* |


| Invoice Items |
| --- |
| **Returns a collectionn of all invoice items** |
| */api/v1/invoice_items* |
| **Returns a single invoice item** |
| */api/v1/invoice_items/`:id`* |
| **Returns a single object representation** |
| */api/v1/invoice_items/find?=`(query)`* |
| **Returns all matches for the given query** |
| */api/v1/invoice_items/find_all?=`(query)`* |
| **Returns the associated invoice** |
| */api/v1/invoice_items/`:invoice_item_id`/invoice* |
| **Returns the associated item** |
| */api/v1/invoice_items/`:invoice_item_id`/item* |


| Transactions |
| --- |
| **Returns a collection of all transactions** |
| */api/v1/transactions* |
| **Returns a single transaction** |
| */api/v1/transactions/`:id`* |
| **Returns a single object representation** |
| */api/v1/transactions/find?=`(query)`* |
| **Returns all matches for the given query** |
| */api/v1/transactions/find_all?=`(query)`* |
| **Returns the associated invoice** |
| */api/v1/transactions/`:transaction_id`/invoice* |
