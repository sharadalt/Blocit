require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, :type => :controller do
  let (:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sppost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
  describe "Get new" do
      it "returns http success" do
          get :new, topic_id: my_topic.id
          expect(response).to have_http_status(:success)
      end
      it "renders the #new view" do
          get :new, topic_id: my_topic.id
          expect(response).to render_template :new
      end
      it "intializes @sponsored_post" do
          get :new, topic_id: my_topic.id
          expect(assigns(:sponsored_post)).not_to be_nil
      end
  end
  
  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sppost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
     get :show, topic_id: my_topic.id, id: my_sppost.id
      expect(response).to render_template :show
    end
    
    it "assigns my_sppost to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sppost.id
      expect(assigns(:sponsored_post)).to eq(my_sppost)
    end
  end
  describe "GET edit" do
     it "returns http success" do
       get :edit, topic_id: my_topic.id, id: my_sppost.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, topic_id: my_topic.id, id: my_sppost.id
 # #1
       expect(response).to render_template :edit
     end
 
 # #2
     it "assigns sponsored_post to be updated to @sponsored_post" do
       get :edit, topic_id: my_topic.id, id: my_sppost.id
 
       spost_instance = assigns(:sponsored_post)
 
       expect(spost_instance.id).to eq my_sppost.id
       expect(spost_instance.title).to eq my_sppost.title
       expect(spost_instance.body).to eq my_sppost.body
     end
   end 
   describe "POST create" do
 # #4
      it "increases the number of SponsoredPosts by 1" do
        expect{post :create, topic_id: my_topic.id, sponsored_post: {name: RandomData.random_sentence, description: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
      end
 
 # #5
      it "assigns the SponsoredPost.last to @sponsored_post" do
        post :create, topic_id: my_topic.id, sponsored_post: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
        expect(assigns(:sponsored_post)).to eq SponsoredPost.last
      end
 
 # #6
      it "redirects to the new sponsored_post" do
        post :create, topic_id: my_topic.id, sponsored_post: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
        expect(response).to redirect_to [my_topic, SponsoredPost.last]
      end
  end
   
   
end