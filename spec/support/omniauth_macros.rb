module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = {
      'provider' => 'facebook',
      'uid' => '123545',
      'user_info' => {
        'name' => 'mockuser',
        'email' => 'mock_user@boh.it'
        'role' => 'Admin'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      }
    }
  end
end
