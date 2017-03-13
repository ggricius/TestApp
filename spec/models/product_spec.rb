require 'rails_helper'
describe Product do

  before do
  #here you put your code to generate test content
    @product = Product.create!(name: "kit kat bitter cat")
    @user = User.create!(first_name: "Gabriella",email: "gabriella.gricius@gmail.com", last_name: "Gricius",password: "todomeshe")
    @product.comments.create!(rating: 1, user: @user, body: "Horrible")
    @product.comments.create!(rating: 3, user: @user, body: "Just midrange")
    @product.comments.create!(rating: 5, user: @user, body: "The best thing ever")
  end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq(3)
    end
    it "is not valid" do
  	expect(Product.new(description: "Lovely cat")).not_to be_valid
  end
end
