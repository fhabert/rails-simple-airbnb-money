class OrdersController < ApplicationController
    def create
        flat = Flat.find(params[:flat_id])
        counter = params[:amount_price].to_i
        flat.update(sku: "Nice little home")
        order = Order.create!(flat_id: flat.id, flat_sku: flat.sku, amount_cents: flat.price_cents * counter, state: 'pending', user: current_user)

        Stripe.api_key = 'sk_test_51Is7I7HY7atuhjIoL0Tf8cKgFExdvDB4mAOyJTugoomxRuDA6ajPD26oLXcmjdyeQ4MJmhSZOJJJLCrDEvmXh1bP00p6tc8gQZ'

        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: flat.sku,
            images: [flat.url],
            amount: flat.price_cents,
            currency: 'eur',
            quantity: 1
          }],
          success_url: "http://localhost:3000",
          cancel_url: "http://localhost:3000"
        )
        order.update(checkout_session_id: session.id)
        redirect_to new_order_payment_path(order)
      end

      def show
        @order = current_user.orders.find(params[:id])
      end
end
