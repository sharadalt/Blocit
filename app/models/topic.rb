class Topic < ActiveRecord::Base
    #has_many :posts
    has_many :posts, dependent: :destroy
    has_many :labelings, as: :labelable
 # #13
    has_many :labels, through: :labelings
    scope :visible_to, -> (user) { user ? all : where(public: true) }
    validates :name, length: { minimum: 5 }, presence: true
    validates :description, length: { minimum: 15 }, presence: true
end
