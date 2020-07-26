OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "313843122941025", '28aa8f15e8556bc07a2f7f3dd3bbce4b'
  provider :google_oauth2,'888831922072-mr1iuah3ufl82egch452in9kp7v9c1kp.apps.googleusercontent.com', 'qSKDibqODu6geCl8Ipkwo4c9'
end

  