require 'rails_helper'

RSpec.describe Question, type: :model do
   let(:question) { Question.create!(title: "New Post Title", body: "New Post Body", resolved: true) }
 
   describe "attributes" do
     it "has title , body and resolved attributes" do
       expect(question).to have_attributes(title: "New Post Title", body: "New Post Body" , resolved: true)
     end
     it "should respond to resolved" do
         expect(question).to respond_to(:resolved)
     end
   end
end
