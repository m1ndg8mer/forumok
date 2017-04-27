require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  describe "GET #index" do

    before :each do
      user = FactoryGirl.create(:user)
      sign_in user, scope: :user
      get :index
    end

    it "populates an array of categories" do
      category = FactoryGirl.create(:category)
      expect(assigns(:categories)).to match_array([category])
    end

    it "renders the :index view" do
      expect(response).to render_template("index")
    end

  end

  describe 'GET #show' do
    render_views
    
    let(:category) { FactoryGirl.create(:category) }
    
    before :each do
      get :show, params: { id: category }
    end

    it "check the requested category" do
      expect(response.body).to have_content(category.body)
    end

    it "renders the :show template" do
      expect(response).to render_template("show")
    end

  end

end