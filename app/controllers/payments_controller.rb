class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
    token = params[:stripeToken]
    @product = Product.friendly.find(params[:product_id])
    @user = current_user

    begin
      charge = Stripe::Charge.create(
        :amount =>  @product.price, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )

    if charge.paid
      Order.create(
        user_id: "@user_id",
        product_id: "@product_id",
        total: "@product_price"
         )
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(product)
  end
end
