class User < ApplicationRecord
    # Add a has_many association to the User model
    has_many :posts, dependent: :destroy

    # Add secure password handling
    has_secure_password
  
    # Ensure email is present and unique
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

    scope: :alphabetical, -> { order(:first_name, :last_name) }
    scope: :faves, -> { where(is_fave: true)}
    scope: :find_by_email, -> (email) { where(email: email).first }
    scope: :find_by_credentials, -> (email, password) { user = User.find_by_email(email); user && user.authenticate(password) ? user : nil }
    scope: :recently_created, -> { where("created_at > ?", 1.week.ago) }

    def full_name
        "#{first_name} #{last_name}"
    end


end
