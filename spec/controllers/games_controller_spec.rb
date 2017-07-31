require 'spec_helper'
require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    
    describe "GET #index" do
        context 'user not banned' do
            it "populates an array of games" do
                game = FactoryGirl.create(:game)
                get :index
                expect(assigns(:games)).to eq([game])
            end
            
            it "renders the :index view" do
                get :index
                response.should render_template :index
            end
        end
    end
end
