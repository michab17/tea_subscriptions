require 'rails_helper'

RSpec.describe 'Subscription API' do
  let!(:tea) { Tea.create(name: 'Oolong', description: 'It tastes good', temperature: '50C', brew_time: '5 minutes') }
  
  let!(:customer) { Customer.create(name: 'Kevin', email: 'kevin@example.com', address: '1234 My Street') }

  describe 'POST api/v1/subscription' do
    it 'creates a new subscription for a customer' do
      subscription_params = {
        tea_id: tea.id,
        customer_id: customer.id,
        price: '$3.00',
        status: 'Active',
        frequency: 'monthly'
      }

      post '/api/v1/subscriptions', params: subscription_params.to_json, headers: headers

      expect(response).to be_successful

      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).not_to be_empty
      expect(subscription).to be_a Hash
      expect(subscription[:data][:type]).to eq('subscription')
      expect(subscription[:data][:attributes].length).to eq(5)
      expect(subscription[:data][:attributes]).to include(:customer_id, :tea_id, :price, :status, :frequency)
    end
  end

  describe 'PATCH api/v1/subscription/:id' do
    it 'changes a subscription status from active to canceled' do
      subscription = Subscription.create(tea_id: tea.id, customer_id: customer.id, price: '$3.00', status: 'Active', frequency: 'monthly')

      patch "/api/v1/subscriptions/#{subscription.id}", headers: headers

      expect(response).to be_successful

      subscription.reload

      expect(subscription.status).to eq 'Canceled'
    end
  end

  describe 'GET api/v1/subscription/:customer_id' do
    let!(:subscription1) { Subscription.create(customer_id: customer.id, tea_id: tea.id, price: '$3.00', status: 'Active', frequency: 'monthly')}
    let!(:subscription2) { Subscription.create(customer_id: customer.id, tea_id: tea.id, price: '$3.00', status: 'Canceled', frequency: 'monthly')}
    let!(:subscription3) { Subscription.create(customer_id: customer.id, tea_id: tea.id, price: '$3.00', status: 'Active', frequency: 'monthly')}

    it 'returns a list of subscriptions for a customer' do
      get "/api/v1/subscriptions/#{customer.id}"

      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(subscriptions).to_not be_empty
      expect(subscriptions.count).to eq 3

      subscriptions.each do  |subscription|
        expect(subscription[:attributes]).to have_key(:customer_id)
        expect(subscription[:attributes][:customer_id]).to be_an Integer
        expect(subscription[:attributes][:customer_id]).to eq customer.id

        expect(subscription[:attributes]).to have_key(:tea_id)
        expect(subscription[:attributes][:tea_id]).to be_an Integer
        expect(subscription[:attributes][:tea_id]).to eq tea.id

        expect(subscription[:attributes]).to have_key(:price)
        expect(subscription[:attributes][:price]).to be_a String
        expect(subscription[:attributes][:price]).to eq '$3.00'
        
        expect(subscription[:attributes]).to have_key(:status)
        expect(subscription[:attributes][:status]).to be_a String

        expect(subscription[:attributes]).to have_key(:frequency)
        expect(subscription[:attributes][:frequency]).to be_a String
        expect(subscription[:attributes][:frequency]).to eq 'monthly'
      end
    end
  end
end