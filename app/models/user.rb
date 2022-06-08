class User < ApplicationRecord

  has_secure_password

  validates :fname, presence: true
  validates :lname, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }


  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase
    user = User.find_by_email(new_email)

    if user && user.authenticate(password)
      user
    else
    nil
  end
end 
end
