class Label < ActiveRecord::Base
  has_many :labelings
  belongs_to :labelable, polymorphic: true
  
  def self.update_labels(label_string)
 # #24
     return Label.none if label_string.blank?
 
# #25

     label_string.split(",").map do |label|
       Label.find_or_create_by(name: label.strip)
     end
   end
 # #4
  has_many :topics, through: :labelings, source: :labelable, source_type: :Topic
 # #5
  has_many :posts, through: :labelings, source: :labelable, source_type: :Post
end