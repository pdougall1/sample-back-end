module Auth
  class Password

    def initialize(password)
      @password = password
      @encrypted = SCrypt::Password.create(@password)
    end

    def to_s
      @encrypted.to_s
    end

    def matches?(encypted_password)
      SCrypt::Password.new(encypted_password) == @password
    end
  end
end
