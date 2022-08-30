require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  fixtures :all
  before(:example) { sign_in(users(:rick)) }
  let(:current_user) { users(:rick) }
  let(:morty_post) { posts(:morty_hello_world)}

  describe "POST create" do
    context "valid params" do
      it "creates comment and redirects to posts#index" do
        params = {
          comment: {
            body:  "Test",
            commentable_id: morty_post.id,
            commentable_type: Post.name,
            user:  current_user.id,
          }
        }

        expect { post("/comments", params: params) }.to change(Comment, :count)
        follow_redirect!

        expect(response).to render_template(:index)
        expect(response.body).to include("Comment created successfully")
      end
    end

    context "invalid params" do
      it "creates post and redirects to index" do
        params = {
          comment: {
            body: "Test",
            user: current_user.id,
          }
        }

        expect { post("/comments", params: params) }.not_to change(Comment, :count)
        follow_redirect!

        expect(response).to render_template(:index)
        expect(response.body).to include("There was a problem saving the comment")
      end
    end
  end
end
