class AuthenticateUser
  attr_reader :user, :auth_token
  include ActiveModel::Validations
  validate :user_existance

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    return false unless valid?
    @auth_token = JsonWebToken.encode(user_id: @user.id)
  end

  private

  attr_accessor :email, :password

  def user_existance
    @user = User.find_by(email: email)
    return @user if @user&.authenticate(password)
    errors.add(:user, 'invalid credentials')
  end
end
