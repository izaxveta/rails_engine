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

# Routes

To run server and launch queries,
rails s
