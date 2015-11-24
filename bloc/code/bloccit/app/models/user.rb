class User < ActiveRecord::Base
    before_save { self.email = email.downcase 
                  names = self.name.split(" ")
                  self.first_name = names[0]
                  self.last_name  = names[1]
                  @user.each do |u|
                      u.first_name.capitalize
                      u.last_name.capitalize
                      u.name = u.first_name.join.last_name(" ")
                  end
    }

 # #3
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

 # #4
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #5
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
 # #6
    validates :email,
      presence: true,
      uniqueness: { case_sensitive: false },
      length: { minimum: 3, maximum: 100 },
      format: { with: EMAIL_REGEX }

 # #7
    has_secure_password
end
