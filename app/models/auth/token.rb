require 'scrypt'

module Auth
  class Token

    def initialize(token = nil, random_factory: SecureRandom)
      if token
        @token = token
      else
        @token = random_factory.base64(24)
        @hashed = SCrypt::Password.create(@token)
      end
    end

    def to_s
      @token.to_s
    end

    def to_hash
      @hashed.to_s
    end

    def matches?(hashed_string)
      SCrypt::Password.new(hashed_string) == @token
    end
  end
end
