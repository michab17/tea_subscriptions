![rails-badge](https://img.shields.io/badge/Rails-5.2.6-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.2-informational?style=flat-square)

This repository is a fully functional backend API that supports the ability to have teas customers and subscriptions. The Tea and Customer tables both have a one to many relationship with subscriptions. Right now this is just a basic api with the ability to have a customer start a subscription, end a subscription and see all of their subscriptions.

#### What can I do with this API?
  - Add subscriptions to your account with information such as:
    - Price
    - Status
    - Frequency
  - End a subscription
  - Get a list of all of your subscriptions

#### Stack
- Ruby on Rails, RSpec, PostgreSQL, JsonAPI Serializer

# Readme Content
- [Local Setup](#local-setup)
- [Endpoints](#enpoints)
- [Contributors](#contributors)

# Local Setup
- Versions
  - Rails 5.2.6
  - Ruby 2.7.2
- Fork and clone the repository
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle` (if this fails, try to `bundle update` and then retry)
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
- Run your own development server:
  - `rails s`
  - BackEnd local server address is:  "http://localhost:3000"

# Endpoints

Gets all of the Subscriptions from a specific customer
 - GET    /api/v1/subscriptions/:customer_id

Creates a new Subscription for a customer
 - POST   /api/v1/subscriptions

Changes the status of a Subscription from 'Active' to 'Canceled'
 - PATCH    /api/v1/subscriptions/:id


# Contributors
- Micha Bernhard   |  [Github](https://github.com/michab17)   |   [LinkedIn](https://www.linkedin.com/in/micha-bernhard/)
