# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_server_dns_session',
  :secret      => '91ee77f1769387349f85775b520682348584333522a1a179dd682bb8dd30b0530354a514288fe70ff990998ed7d7b5bfcad7d41580da731f9b97e55c356f1ecc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
