require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  fixtures :all
  before(:example) { sign_in(users(:rick)) }
  let(:current_user) { users(:rick) }

  describe "GET /" do
    it "assigns @posts and renders index" do
      get("/")

      expect(assigns(:posts).count).to eq(Post.count)
      expect(response).to render_template(:index)
    end
  end

  describe "GET index" do
    context "not signed in" do
      before(:example) { sign_out(users(:rick)) }

      it "redirects to sign_in" do
        get("/posts")
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "signed in" do
      it "assigns all @posts and renders index" do
        get("/posts")

        expect(assigns(:posts).count).to eq(Post.count)
        expect(response).to render_template(:index)
      end
    end
  end

  describe "POST create" do
    context "valid params" do
      it "creates post and redirects to index" do
        params = {
          post: {
            title: "Test",
            body:  "Test",
            user:  current_user.id,
          }
        }

        expect { post("/posts", params: params) }.to change(Post, :count)
        follow_redirect!

        expect(response).to render_template(:index)
        expect(response.body).to include("Post created successfully")
      end
    end

    context "invalid params" do
      it "creates post and redirects to index" do
        params = {
          post: {
            body: "Test",
            user: current_user.id,
          }
        }

        expect { post("/posts", params: params) }.not_to change(Post, :count)
        follow_redirect!

        expect(response).to render_template(:index)
        expect(response.body).to include("There was a problem saving the post")
      end
    end
  end
end
