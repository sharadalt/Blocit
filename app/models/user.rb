class User < ActiveRecord::Base

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy

    before_save { self.email = email.downcase }
    before_save { self.role ||= :member }
    before_create :generate_auth_token
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
    enum role: [:member, :admin]
    
    def organize_name
        if name
          names = []
          name.split.each do |name_portion|
              names << name_portion.capitalize
          end
          self.name = names.join(" ")
        end
    end
    
    def favorite_for(post)
      favorites.where(post_id: post.id).first
    end
    
    def avatar_url(size)
      gravatar_id = Digest::MD5::hexdigest(self.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
    
    def generate_auth_token
     loop do
       self.auth_token = SecureRandom.base64(64)
       break unless User.find_by(auth_token: auth_token)
     end
   end
    
end
