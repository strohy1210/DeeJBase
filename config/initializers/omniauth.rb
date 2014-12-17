Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == "development"
    provider :facebook, ENV['DEV_FACEBOOK_KEY'], ENV['DEV_FACEBOOK_SECRET'], 
     :scope => 'public_profile', :display => 'popup', image_size: 'large'
   elsif Rails.env == "production"
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], 
     :scope => 'public_profile', :display => 'popup', image_size: 'large'
   end
end


