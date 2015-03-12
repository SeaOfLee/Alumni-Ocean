require 'rails_helper'

describe EventsController do
  before(:each) do
    @event1 = Event.create(event_name:'Test Event', event_description:'This is the description.', event_location:'Los Angeles', event_site:'GA', event_date:'February 2, 2015', event_time:'7:00PM PST')
    @event2 = Event.create(event_name:'Tests Event', event_description:'This is description.', event_location:'Santa Monica', event_site:'General Assembly', event_date:'February 22, 2015', event_time:'9:00PM PST')
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

    it "should assign @events to include events" do
      expect(assigns(:events)).to include(@event1, @event2)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, id: @event1.id
    end

    it "should render the correct template" do
      expect(response).to render_template :show
    end

    it "should assign @event to event" do
      expect(assigns(:event)).to eq(@event1)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "should render the correct page" do
      expect(response).to render_template :new
    end

    it "should make a new Event" do
      expect(assigns(:event)).to be_a(Event)
    end

    it "is not persisted" do
     expect{Event.new}.to change(Event, :count).by(0)
   end
 end

end
