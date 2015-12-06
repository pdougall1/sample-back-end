require 'byebug'

class Session

  def self.create(user_identifier, password)
    new(user_identifier, password).create
  end

  def initialize(user_identifier, password, token_factory: Auth::Token, user_factory: AR::User)
    @password = password
    @user_factory = user_factory
    @token_factory = token_factory
    @user = find_user(user_identifier)
  end

  def token_valid?(token_from_client)
    user_token = @user.hashed_auth_token
    @token_factory.new(token_from_client).matches?(user_token)
  end

  def password_valid?(password)
    Auth::Password.new(password).matches? @user.encrypted_password
  end

  def create
    @token = @token_factory.new
    @user.update_attributes!(hashed_auth_token: @token.to_hash) if @user
    self
  end

  def response
    if @user
      { authentication_token: @token, id: @user.id }
    else
      { error: "Could not find a user with those credentials." }
    end
  end

  def response_status
    case
    when @user.nil?
      :not_found
    when password_valid?(@password)
      :ok
    else
      :unauthorized
    end
  end

  private

  def find_user(user_identifier)
    @user_factory.where(email: user_identifier).first
  end
end
