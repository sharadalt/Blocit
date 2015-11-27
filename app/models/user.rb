class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    before_save :organize_name
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

    has_secure_password
    
    def organize_name
        if name
          names = []
          name.split.each do |name_portion|
              names << name_portion.capitalize
          end
          self.name = names.join(" ")
          puts self.name
        end
    end
end
