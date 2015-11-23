require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
   let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
   let(:sppost) {topic.Sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}
   
   it {should belong_to(:topic)}
 
   describe "attributes" do

     it "should respond to title" do
       expect(sppost).to respond_to(:title)
     end
 # #3
     it "should respond to body" do
       expect(sppost).to respond_to(:body)
     end
   end
end
