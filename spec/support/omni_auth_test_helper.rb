module OmniAuthTestHelper
  def self.valid_facebook_login_setup()
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        "provider"  => "facebook",
        "uid"       => '12345',
        "info" => {
          "email" => "email@email.com",
          "first_name" => "John",
          "last_name"  => "Doe",
          "name"       => "John Doe"
        },
        "credentials" => {
          "token" => "TOKEN",
          "expires_at" => 12345,
          "expires" => true
        }
      })
    end
  end

  def self.facebook_login_failure()
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
  end

end
