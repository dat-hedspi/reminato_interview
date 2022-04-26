require 'rails_helper'
require 'spec_helper'

describe PostsController do
  let(:user) {User.create(name: "DatTT", password: "123123")}

  let(:post_params) do
    {
      link_youtube: "https://youtube.com/embed/2CzXvHRPmls",
      description: "Là ai từ bỏ, Là ai vô tình",
      user_id: user.id
    }
  end

  before(:each) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          Post.create(post_params)
        }.to change{ Post.count }.by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {post: post_params}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created order" do
        post :create, params: {post: post_params}
        response.should redirect_to("/")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, params: {post: { link_youtube: "aaaaaaa" }}
        assigns(:post).should be_a_new(Post)
      end

      it "render the 'shares/index' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, params: {post: { link_youtube: "aaaaaaa" }}
        response.should render_template("shares/index")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested post as @post" do
        post = Post.create! post_params
        put :update, params: {id: post.id, post: post_params}
        assigns(:post).should eq(post)
      end

      it "redirects to the root" do
        post = Post.create! post_params
        put :update, params: {id: post.id, post: post_params}
        response.should redirect_to("/")
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! post_params
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, params: {id: post.id, post: { link_youtube: "aaaaaaa" }}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! post_params
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, params: {id: post.id, post: { link_youtube: "aaaaaaa" }}
        response.should render_template("shares/edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = Post.create! post_params
      expect {
        delete :destroy, params: {id: post.id}
      }.to change{ Post.count }.by(-1)
    end

    it "redirects to the orders list" do
      post = Post.create! post_params
      delete :destroy, params: {id: post.id}
      response.should redirect_to(root_url)
    end
  end

end
