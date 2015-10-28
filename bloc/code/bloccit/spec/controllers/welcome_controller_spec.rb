require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
 describe "GET index" do
     it "renders the index template" do
 # #2
       get :index
 # #3
       expect(response).to render_template("index")
     end
   end
 describe "GET about" do
     it "renders the about template" do
 # #2
       get :about
 # #3
       expect(response).to render_template("about")
     end
   end
   
 describe "GET faq" do
     it "renders the faq template" do
 # #2
       get :faq
 # #3
       expect(response).to render_template("faq")
     end
   end
end
