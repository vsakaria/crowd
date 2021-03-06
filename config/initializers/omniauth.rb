Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['CROWDDJ_FACEBOOK_KEY'], ENV['CROWDDJ_FACEBOOK_SECRET']
  provider :identity, :fields => [:name, :email]
  # provider :identity, on_failed_registration: lambda { |env|
  #   IdentitiesController.action(:new).call(env)
  # }
  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end