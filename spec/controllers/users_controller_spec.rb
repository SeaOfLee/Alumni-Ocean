require 'rails_helper'

describe UsersController do
  before(:each) do
    @user1 = User.create(first_name:'Lee', last_name:'Richardson', email:'lee@lee.com', password: 'password123', password_confirmation: 'password123', current_location: 'Santa Monica', program_attended: 'WDI', campus: 'Atlanta', cohort: '14', bio: 'Arg', avatar_file_name: "AsianSalad_Square.png", avatar_content_type: "image/png",
    avatar_file_size: 1013175)
    @user2 = User.create(first_name:'Lee', last_name:'Richardson', email:'lee@me.com', password: 'password123', password_confirmation: 'password123', current_location: 'Santa Monica', program_attended: 'WDI', campus: 'Atlanta', cohort: '14', bio: 'Arg', avatar_file_name: "AsianSalad_Square.png", avatar_content_type: "image/png",
    avatar_file_size: 1013175)
  end

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it 'should render the correct page' do
      expect(response).to render_template :index
    end

    it "should have status code of 200" do
      expect(response).to have_http_status(200)
    end

    it "should assign @users to include users" do
      expect(assigns(:users)).to include(@user1, @user2)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, id: @user1.id
    end

    it "should render the correct template" do
      expect(response).to render_template :show
    end

    it "should assign @user to user" do
      expect(assigns(:user)).to eq(@user1)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "should render the correct page" do
      expect(response).to render_template :new
    end

    it "should make a new User" do
      expect(assigns(:user)).to be_a(User)
    end

    it "is not persisted" do
     expect{User.new}.to change(User, :count).by(0)
   end
 end

 # describe "POST #create" do

  #  it "persists a user to the DB" do
  #   expect{User.create(first_name:'Lee', last_name:'Richardson', email:'lee@lee.com', password: '123')}.to change(User :count).by(1)
  # end

  # describe "DELETE #destroy" do
  #   before do
  #     @test_user = User.create
  #     get :index
  #   end

  #   it "should delete an item from the DB" do
  #     expect{delete :destroy, id: @test_user.id}.to change(User, :count).by(-1)
  #   end




  end
