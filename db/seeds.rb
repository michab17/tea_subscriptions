# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)
customer2 = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)
customer3 = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)
customer4 = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)
customer5 = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)

tea1 = Tea.create!(name: 'Black Tea', description: Faker::Lorem.sentence, temperature: Faker::Number.within(range: 100..212), brew_time: Faker::Number.within(range: 30..60))
tea2 = Tea.create!(name: 'Green Tea', description: Faker::Lorem.sentence, temperature: Faker::Number.within(range: 100..212), brew_time: Faker::Number.within(range: 30..60))
tea3 = Tea.create!(name: 'White Tea', description: Faker::Lorem.sentence, temperature: Faker::Number.within(range: 100..212), brew_time: Faker::Number.within(range: 30..60))
tea4 = Tea.create!(name: 'Oolong Tea', description: Faker::Lorem.sentence, temperature: Faker::Number.within(range: 100..212), brew_time: Faker::Number.within(range: 30..60))
tea5 = Tea.create!(name: 'Herbal Tea', description: Faker::Lorem.sentence, temperature: Faker::Number.within(range: 100..212), brew_time: Faker::Number.within(range: 30..60))

subscription1 = Subscription.create!(tea_id: tea1.id, customer_id: customer1.id, price: '$3.00', status: 'Active', frequency: 'monthly')
subscription2 = Subscription.create!(tea_id: tea1.id, customer_id: customer1.id, price: '$3.00', status: 'Active', frequency: 'yearly')
subscription3 = Subscription.create!(tea_id: tea1.id, customer_id: customer1.id, price: '$3.00', status: 'Active', frequency: 'daily')
subscription4 = Subscription.create!(tea_id: tea2.id, customer_id: customer2.id, price: '$3.00', status: 'Active', frequency: 'monthly')
subscription5 = Subscription.create!(tea_id: tea2.id, customer_id: customer2.id, price: '$3.00', status: 'Active', frequency: 'yearly')