require 'byebug'

class Session

  def self.create(user_identifier)
    new(user_identifier).create
  end

  def initialize(user_identifier, token_factory: AuthToken, user_factory: AR::User)
    @user_factory = user_factory
    @token_factory = token_factory
    @user = find_user(user_identifier)
  end

  def token_valid?(token_from_client)
    user_token = @user.hashed_auth_token
    @token_factory.new(token_from_client).matches?(user_token)
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
    if @user
      :ok
    else
      :not_found
    end
  end

  private

  def find_user(user_identifier)
    @user_factory.where(email: user_identifier).first
  end
end
