require 'rails_helper'

describe PostsController do
  before(:each) do
    @post1 = Post.create(title: 'title', content: 'this is good content', id: "136")
    @post2 = Post.create(title: 'title2', content: 'this is even better content', id: "137")
  end

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "should render the correct page" do
      expect(response).to render_template :index
    end

    it "should have status code of 200" do
      expect(response).to have_http_status(200)
    end

    it "should assign @post to post" do
      expect(assigns(:posts)).to include(@post1, @post2)
    end
  end

  describe 'GET #show' do
    before(:each) do
      get :show, id: @post1.id
    end

    it "should render the correct template" do
      expect(response).to render_template :show
    end

    it "assigns @post to post" do
      expect(assigns(:post)).to eq(@post1)
    end
  end

  describe 'GET #new' do
    before(:each) do
      get :new
    end

    it 'renders the correct page' do
      expect(response).to render_template :new
    end

    it 'makes a new Post' do
      expect(assigns(:post)).to be_a(Post)
    end

  describe "POST #create" do
    it "persists an item to the DB" do
      expect{Post.create(title: 'Test 4', content: 'yeehaw', id: "148")}.to change(Post, :count).by(1)
      # expect {post :create, item: valid_attributes}.to change(Item, :count).by(1)
      # like get :index or :new
    end
  end

  describe "DELETE #destroy" do
    before do
      @test_post = Post.create(title: 'Test 3', content: 'woooo', id: "143")
      get :index
    end

    it "deletes a post from the DB" do
      expect{delete :destroy, id: @test_post.id}.to change(Post, :count).by(-1)
    end

    it "redirects to index page" do
      expect(response).to render_template :index
    end
  end


  end
end
