require "rails_helper"

RSpec.describe AuthorsController do
  let(:attributes) do
    {
      name: "H. Jeff",
      email: "jeff@sbahj.info",
      phone_number: "5553059028"
    }
  end
  let(:found) { Author.find(@author.id) }

  before { @author = Author.create!(attributes) }

  describe "showing an author" do
    it "shows an author" do
      get :show, id: @author.id
      expect(found).to eq(@author)
    end
  end

  describe "creating a valid author" do
    let(:bro_attributes) do
      {
        name: "S. Bro",
        email: "bro@sbahj.info",
        phone_number: "5558018045"
      }
    end
    let(:bro_found) { Author.find_by(name: bro_attributes[:name]) }

    before { post :create, bro_attributes }

    it "creates successfully" do
      expect(bro_found).to be_a(Author)
    end

    it "redirects to show page" do
      expect(response).to redirect_to(author_path(bro_found))
    end
  end
end 
