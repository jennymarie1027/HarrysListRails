class User < ApplicationRecord
    # Add a has_many association to the User model
    has_many :posts, :dependent => :destroy

    # Add secure password handling
    has_secure_password
  
    # Ensure email is present and unique
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

    scope :alphabetical, -> { order(:email) };
    scope :faves, -> { where(is_fave: true)};
    scope :find_by_email, -> (email) { where(email: email).first };
    scope :recently_created, -> { where("created_at > ?", 1.week.ago) };
    # scope :find_by_credentials, -> (email, password) { user = User.find_by_email(email); user && user.authenticate(password) ? user : nil };

    after_create :log_created_user
    after_update :log_updated_user
    # after_save :log_saved_user
    # after_commit :cleaning_reminder, if => :too_many_records?

    # private
    def log_created_user
        logger.info("successfully created user with id")
    end

    def log_updated_user
        logger.info("successfully updated user with id")
    end

    def log_saved_user
        # byebug
        logger.info("successfully saved user with id")
    end

    def cleaning_reminder
        logger.info("Cleaning reminder: too many records in the database")
    end

    def too_many_records?
        User.count > 1000
    end
end
