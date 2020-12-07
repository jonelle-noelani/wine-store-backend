require 'stripe'

get '/secret' do
    intent = Stripe::PaymentIntent.last
    {client_secret: intent.client_secret}.to_json
end