if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['pk_test_p7XtytEmC23du6t7ToDhpn19'],
    :secret_key => ENV['sk_test_22hDKe7TrJQOZwiiRsL26gP2']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_zkT...',
    :secret_key => 'sk_test_I0e...'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
