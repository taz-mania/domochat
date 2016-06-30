module OmniauthMacros

def facebook_hash
 OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new
 ({provider: "facebook",
   uid: "123545",
   info: {
     email: "example_facebook@xyze.it",
     name: "Alberto Pellizzon",
     first_name: "Alberto",
     last_name: "Pellizzon",
   },
   extra: {
    raw_info: {
     name: "facebook_oauth_user"
   }
 }
 })
end
end