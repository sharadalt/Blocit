class Topic < ActiveRecord::Base
    #has_many :posts
    has_many :posts, dependent: :destroy
    has_many :labelings, as: :labelable
 # #13
    has_many :labels, through: :labelings
    scope :publically_viewable, -> { where(public: true)}
    scope :privately_viewable, -> { where(public: false)}
    scope :visible_to, -> (user) { user ? all : publically_viewable }
    validates :name, length: { minimum: 5 }, presence: true
    validates :description, length: { minimum: 15 }, presence: true
end
