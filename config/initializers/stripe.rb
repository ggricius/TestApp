if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_p7XtytEmC23du6t7ToDhpn19',
    :secret_key => 'sk_test_22hDKe7TrJQOZwiiRsL26gP2'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
