require 'rails-helper'
require 'spec-helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "street bike") }
    let(:user) { User.create!(password: "password", email: "email@gmx.de") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike!")).not_to be_valid
    end

    it "is valid with a descrition" do
      expect(Product.new(description: "awesome")).to be_valid
    end
  end
end
