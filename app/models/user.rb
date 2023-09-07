class User < ApplicationRecord
    has_secure_password

    validates :full_name, :username, :email, presence: true
    validates :email, :username ,uniqueness: true
    validates :password, length: { minimum: 6 }, format: { with: /\A.*[a-zA-Z].*\d.*\z/ , message: "must contain letters and at least one number"}
end
