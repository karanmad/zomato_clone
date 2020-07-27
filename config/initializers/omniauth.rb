OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "391563235137759", 'e29fc198ef9b416744756958cdbb167e'
  provider :google_oauth2,'888831922072-mr1iuah3ufl82egch452in9kp7v9c1kp.apps.googleusercontent.com', 'qSKDibqODu6geCl8Ipkwo4c9'
end

  