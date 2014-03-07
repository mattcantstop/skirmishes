class User < ActiveRecord::Base
  include Tokenable

  has_secure_password
  before_save :ensure_authentication_token

  validates :username, :uniqueness => { :case_sensitive => false }

  has_many :wars

  private

  def ensure_authentication_token
    @token = generate_token
    self.authentication_token = @token
  end

end
