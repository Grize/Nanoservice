module AuthorizationService
  class << self
    def check_token(token)
      user = User.find_by(token: token)
      true if user != nil
    end
  end
end
