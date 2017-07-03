require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsoredpost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsored post to @sponsoredpost" do
      get :show, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(assigns(:sponsoredpost)).to eq(my_sponsoredpost)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @sponsoredpost" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of SponsoredPost by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {name: RandomData.random_sentence, description: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new sponsored post to @sponsoredpost" do
      post :create, topic_id: my_topic.id, sponsored_post: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
      expect(assigns(:sponsoredpost)).to eq SponsoredPost.last
    end

    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsored_post: {name: RandomData.random_sentence, description: RandomData.random_paragraph}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to render_template :edit
    end

    it "assigns sponsored post to be updated to @sponsoredpost" do
      get :edit, topic_id: my_topic.id, id: my_sponsoredpost.id

      sponsoredpost_instance = assigns(:sponsoredpost)

      expect(sponsoredpost_instance.id).to eq my_sponsoredpost.id
      expect(sponsoredpost_instance.title).to eq my_sponsoredpost.title
      expect(sponsoredpost_instance.body).to eq my_sponsoredpost.body
    end
  end

  describe "PUT update" do
    it "updates sponsored post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, topic_id: my_topic.id, id: my_sponsoredpost.id, sponsored_post: {title: new_title, body: new_body}

      updated_sponsoredpost = assigns(:sponsoredpost)
      expect(updated_sponsoredpost.id).to eq my_sponsoredpost.id
      expect(updated_sponsoredpost.title).to eq new_title
      expect(updated_sponsoredpost.body).to eq new_body
    end

    it "redirects to the updated sponsored post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, topic_id: my_topic.id, id: my_sponsoredpost.id, sponsored_post: {title: new_title, body: new_body}
      expect(response).to redirect_to [my_topic, my_sponsoredpost]
    end
  end

  describe "DELETE destroy" do
    it "deletes the sponsored post" do
      delete :destroy, topic_id: my_topic.id, id: my_sponsoredpost.id
      count = SponsoredPost.where({id: my_sponsoredpost.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_sponsoredpost.id
      expect(response).to redirect_to my_topic
    end
  end

end