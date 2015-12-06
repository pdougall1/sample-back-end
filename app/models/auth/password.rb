module Auth
  class Password

    def initialize(password)
      @password = password
      @encrypted = SCrypt::Password.create(@password)
    end

    def to_s
      @encrypted.to_s
    end
  end
end
