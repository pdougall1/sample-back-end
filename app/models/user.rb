class User

  def self.create(params)
    new.create(params)
  end

  def initialize(ar_user_factory: AR::User, password_factory: Auth::Password)
    @password_factory = password_factory
    @ar_user_factory = ar_user_factory
  end

  def create(params)
    @params = params
    @ar_user_factory.create(ar_params)
  end

  private

  def ar_params
    @ar_params ||= @params.dup.merge({
      encrypted_password: encrypted_password
    }).except(:password, :password_confirmation)
  end

  def encrypted_password
    if @params[:password] == @params[:password_confirmation]
      @password_factory.new(@params[:password])
    end
  end
end
