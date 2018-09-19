class UserCreation
  attr_reader :user, :auth_token

  def initialize(user_params)
    @user_params = user_params
  end

  def call
    @user = User.new(@user_params)
    return false unless @user.save
    @auth_token = JsonWebToken.encode(user_id: @user.id)
  end

  def errors
    user&.errors
  end

  def valid?
    user&.valid?
  end
end
