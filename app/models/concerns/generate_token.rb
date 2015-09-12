module GenerateToken
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  def generate_api_key
    update_attribute(:api_key, SecureRandom.urlsafe_base64(nil, false))
  end

  protected

  def generate_token
    self.api_key = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(api_key: random_token)
    end
  end
end
