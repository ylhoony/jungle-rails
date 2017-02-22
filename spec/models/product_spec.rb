require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.create(name: "Apparel")
  end

  describe 'Validations' do

    it "is valid with all parameters" do
      product = @category.products.new(
        price: 99.99,
        name: "test product",
        quantity: 100
      )
    end

    it "is not valid without a name" do
      product = @category.products.new(
        price: 99.99,
        quantity: 100
      )

      expect(product).to_not be_valid
      # product.errors.full_messages
    end

    it "is not valid without price" do
      product = @category.products.new(
        name: "test product name",
        quantity: 100
      )

      expect(product).to_not be_valid
      # product.errors.full_messages
    end

    it "is not valid without quantity" do
      product = @category.products.new(
        name: "test product name",
        price: 99.99
      )

      expect(product).to_not be_valid
      # product.errors.full_messages
    end

    it "is not valid without category" do
      product = Product.new(
        name: "test product name",
        price: 99.99,
        quantity: 100
      )

      expect(product).to_not be_valid
      # product.errors.full_messages
    end

  end

end
