 require 'rails_helper'
 include Devise::TestHelpers

RSpec.describe Users::OmniauthCallbacksController do
describe "facebook" do
	before do
  		Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  		Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
	end
end
end