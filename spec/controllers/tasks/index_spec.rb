require 'rails_helper'
RSpec.describe TasksController, type: :controller do

  describe "GET index responds to" do
    context "text/html" do
      it "respose status 200" do

        get :index, format: :html

        expect(response.header['Content-Type']).to include('text/html')
        expect(response.status).to eq(200)
      end
    end
  end

end
