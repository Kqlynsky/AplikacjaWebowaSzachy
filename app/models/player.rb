class Player < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    has_secure_password
    def invalidate_token
        self.update_columns(token: nil)
    end
end