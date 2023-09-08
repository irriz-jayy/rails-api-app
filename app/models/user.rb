class User < ApplicationRecord
    has_secure_password

    validates :full_name, :username, :email, presence: true
    validates :email, :username ,uniqueness: true
end
