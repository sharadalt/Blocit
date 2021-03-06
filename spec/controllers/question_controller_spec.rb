require 'rails_helper'
include RandomData

RSpec.describe QuestionController, :type => :controller do
  let(:my_qt){ Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_qt] to @questions" do
       get :index
 # #9
       expect(assigns(:questions)).to eq([my_qt])
    end
  end
  
  describe "Get new" do
      it "returns http success" do
          get :new
          expect(response).to have_http_status(:success)
      end
      it "renders the #new view" do
          get :new
          expect(response).to render_template :new
      end
      it "instantiates @question" do
          get :new
          expect(assigns(:question)).not_to be_nil
      end
  end
  describe "POST create" do
 # #4
      it "increases the number of Question by 1" do
        expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Question,:count).by(1)
      end
 
 # #5
      it "assigns the new question to @question" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(assigns(:question)).to eq Question.last
      end
 
 # #6
      it "redirects to the new question" do
        post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
        expect(response).to redirect_to Question.last
      end
  end
  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_qt.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: my_qt.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_qt to @question" do
      get :show, {id: my_qt.id}
      expect(assigns(:question)).to eq(my_qt)
    end
  end
  describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_qt.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_qt.id}
 # #1
       expect(response).to render_template :edit
     end
 
 # #2
     it "assigns post to be updated to @post" do
       get :edit, {id: my_qt.id}
 
       question_instance = assigns(:question)
 
       expect(question_instance.id).to eq my_qt.id
       expect(question_instance.title).to eq my_qt.title
       expect(question_instance.body).to eq my_qt.body
     end
   end
   
   describe "PUT update" do
        it "updates question with expected attributes" do
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph
    
          put :update, id: my_qt.id, question: {title: new_title, body: new_body}
    
    # #3
          updated_question = assigns(:question)
          expect(updated_question.id).to eq my_qt.id
          expect(updated_question.title).to eq new_title
          expect(updated_question.body).to eq new_body
        end
    
        it "redirects to the updated post" do
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph
    
    # #4
          put :update, id: my_qt.id, question: {title: new_title, body: new_body}
          expect(response).to redirect_to my_qt
        end
     end
     describe "DELETE destroy" do
        it "deletes the question" do
          delete :destroy, {id: my_qt.id}
    # #6
          count = Question.where({id: my_qt.id}).size
          expect(count).to eq 0
        end
    end
end
