require 'rails_helper'
include Devise::TestHelpers

describe "Omniauthpages", type: :request do

before do
  	Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  	Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
end

  subject { page }
 
  describe 'with facebook oauth' do
 
    context "valid oauth signin when facebook email doesn't exist" do
      let(:oauth_user) { set_omniauth(:facebook) }
      
      before do
        login_with_omniauth(oauth_user.provider)
      end

      it "should Successfully authenticated from Facebook" do
       identity = Identity.where(:provider => oauth_user.provider, :uid => oauth_user.uid).first
	     user = User.where(:id => identity.user).first
	     expect(page).to have_content('Successfully authenticated from Facebook account.')
       expect(oauth_user.provider).to eq 'facebook'
       expect(user).not_to eq nil
       expect(identity.provider).to eq oauth_user.provider
       expect(identity.uid).to eq oauth_user.uid
       expect(user.username).to eq oauth_user.extra.raw_info.name
       #expect(user.email).to eq oauth_user.info.email
      end  
    end
  end
end