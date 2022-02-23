class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(Subscription.where(customer_id: params[:customer_id]))
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