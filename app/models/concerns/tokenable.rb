module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    begin
      self.authentication_token = SecureRandom.urlsafe_base64(nil, false)
    end while self.class.exists?(authentication_token: authentication_token)
  end

end
