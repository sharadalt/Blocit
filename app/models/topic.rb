class Topic < ActiveRecord::Base
    #has_many :posts
    has_many :posts, dependent: :destroy
    has_many :labelings, as: :labelable
 # #13
    has_many :labels, through: :labelings
    has_many :sponsored_posts
    validates :name, length: { minimum: 5 }, presence: true
    validates :description, length: { minimum: 15 }, presence: true
end
