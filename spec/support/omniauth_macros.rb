module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:facebook] = {
      'uid' => '1337',
      'provider' => 'facebook',
      'info' => {
        'name' => 'facebook person'
      }
    }
  end
end

