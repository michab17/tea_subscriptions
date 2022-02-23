class SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def create
    render json: SubscriptionSerializer.new(Subscription.create(subscription_params))
  end

  def update
    subscription = Subscription.update(params[:id], status: 'Canceled')
    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def subscription_params
    params.permit(:customer_id, :tea_id, :price, :status, :frequency)
  end
end