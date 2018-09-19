class AuthorizeApiRequest
  attr_reader :headers, :user
  include ActiveModel::Validations
  validate :request_by_user

  def initialize(headers = {})
    @headers = headers
  end

  def call
    return false unless valid?
    user
  end

  private

  def request_by_user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    errors.add(:user, 'Invalid authentication') unless user
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?
    errors.add(:user, 'Missing token')
    nil
  end
end
