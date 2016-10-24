class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, Rails.applicatom.secrets.secret_key_base)
  end

  def self.decode(token)
    HashWithIndifferentAceess.new(JWT.decode(token, Rails.applicatom.secrets.secret_key_base))
  rescue
    nil
  end
end
