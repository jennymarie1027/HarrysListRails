class User < ApplicationRecord
    # Add a has_many association to the User model
    has_many :posts, dependent: :destroy

    # Add secure password handling
    has_secure_password
  
    # Ensure email is present and unique
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    # validates_presence_of :email, :password_digest

    scope :alphabetical, -> { order(:email) };
    scope :faves, -> { where(is_fave: true)};
    scope :find_by_email, -> (email) { where(email: email).first };
    scope :recently_created, -> { where("created_at > ?", 1.week.ago) };
    # scope :find_by_credentials, -> (email, password) { user = User.find_by_email(email); user && user.authenticate(password) ? user : nil };


end
