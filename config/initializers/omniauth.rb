Rails.application.config.middleware.use OmniAuth::Builder do 
  #for facebook
  provider :facebook, AUTH_DETAILS["FACEBOOK_APP_ID"], AUTH_DETAILS["FACEBOOK_APP_SECRET"]
  #for google_oauth2
  provider :google_oauth2, AUTH_DETAILS["GOOGLE_CLI_ID"], AUTH_DETAILS["GOOGLE_CLI_SECRET"]
end
