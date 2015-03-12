require 'rails_helper'

describe JobsController do
  before(:each) do
    @job1 = Job.create(job_title: "Developer", company: "Google", location: "Santa Monica, CA", job_type: "Remote", contact: "lee@me.com", description: "Who cares, it's Google.")
    @job2 = Job.create(job_title: "Manager", company: "JibJab", location: "Venice, CA", job_type: "Full-Time", contact: "katie@me.com", description: "Elitists only.")
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

    it "should assign @jobs to include jobs" do
      expect(assigns(:jobs)).to include(@job1, @job2)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, id: @job1.id
    end

    it "should render the correct template" do
      expect(response).to render_template :show
    end

    it "should assign @user to user" do
      expect(assigns(:job)).to eq(@job1)
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
      expect(assigns(:job)).to be_a(Job)
    end

    it "is not persisted" do
     expect{Job.new}.to change(Job, :count).by(0)
   end
 end

end
