require 'stripe'

Stripe.api_key = ENV[‘stripe_api_key’]

intent = Stripe::PaymentIntent.create({
  amount: 1099,
  currency: 'usd',
  # Verify your integration in this guide by including this parameter
  metadata: {integration_check: 'accept_a_payment'},
})
