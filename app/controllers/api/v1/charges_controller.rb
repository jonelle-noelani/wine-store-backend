class Api::V1::ChargesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        Stripe.api_key = ENV['stripe_api_key']

        find_items = CartItem.all.filter{|item| item.user_id === params[:checkout_user_id] }
        amount = find_items.map{ |wine| wine.wine.price }.sum * 100
       
        intent = Stripe::PaymentIntent.create({
            amount: amount.to_i,
            currency: 'usd',
            # payment_method_types: ['card'],
            # receipt_email: 'jonelle.noelani@gmail.com',
            # Verify your integration in this guide by including this parameter
            metadata: {integration_check: 'accept_a_payment'},
          })
          render json: {client_secret: intent.client_secret}
        # render json: {message: "hey"}
    end
          
end
