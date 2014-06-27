require 'spec_helper'
describe ElsewhereController do
  let!(:country) { Country.create(name: "United States of America") }
  context "#show" do
    
    it "is successful" do
      get :show, country_name: country.name
      expect(response).to be_success
    end

    context "if country name exists in database" do
      it "assigns @country to correct country in database" do
        get :show, country_name: country.name
        expect(assigns(:country)).to eq Country.find_by(name: country.name)
      end

      it "renders the show template" do
        get :show, country_name: country.name
        expect(response).to render_template "show" 
      end
    end

    context "if country name does not exist in database" do
      it "redirects to index if country is not found" do
        get :show, country_name: "blah"
        expect(response).to redirect_to home_path
      end
    end
  end
end
