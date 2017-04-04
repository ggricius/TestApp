class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
    token = params[:stripeToken]
    #@product = params[:product_id]
    @product = Product.find (params[:product_id])
    @user = current_user

    begin
      charge = Stripe::Charge.create(
        :amount => @product.price,
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
    redirect_to product_path(@product), notice: "Thank you for your purchase!"
  end
end
