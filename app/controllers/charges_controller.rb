# frozen_string_literal: true
# Charges Controller
class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 999

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'DevCloud monthly subscription',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
