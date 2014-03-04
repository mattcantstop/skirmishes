module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    random_token = SecureRandom.urlsafe_base64(nil, false)
    return random_token
  end

end
