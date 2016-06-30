require 'rails_helper'
include Devise::TestHelpers

RSpec.describe OmniauthCallbacksController, :type => :controller do

 	before { @controller = OmniauthCallbacksController.new }

 	describe 'facebook' do
    	OmniAuth.config.test_mode = true
    	before do
    		Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  			Rails.application.env_config["omniauth.auth"] = facebook_hash
   		end

   		describe 'with a new facebook user' do
     		before { redirect_to "/users/auth/facebook" }

     		#it {expect(response).to redirect_to(finish_signup_path)}
        it {expect(:get => "/users/auth/facebook").to route_to("omniauth_callbacks#passthru")}
   		end
   	end
end