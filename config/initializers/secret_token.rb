# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Ganeshatestapp::Application.config.secret_key_base = '7fd5fb396d25174da8dfe8d82f5b62e18191b670d65b829584351c793bcbdabd04b316887cb0981d086745aa466f84a9014a3ebd26475e87742015d07a0c24b9'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Ganeshatestapp::Application.config.secret_key_base = secure_token
