require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should create a new product when all four fields are set" do
      @category = Category.new(name: "Category Test")
      @product = Product.new(
        name: "Product Test",
        price: 19.99,
        quantity: 6,
        category: @category
      )
      expect(@product).to be_valid
  end

  it "should not be valid unless there is a name set" do
    @category = Category.new(name: "Category Test")
    @product = Product.new(
      name: nil,
      price: 19.99,
      quantity: 6,
      category: @category
    )
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include ("Name can't be blank")
  end
  
  it "should not be valid unless there is a price set" do
    @category = Category.new(name: "Category Test")
    @product = Product.new(
      name: "Product Test",
      price_cents: nil,
      quantity: 6,
      category: @category
    )
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include ("Price cents is not a number")
  end

  it "should not be valid unless there is a quantity set" do
    @category = Category.new(name: "Category Test")
    @product = Product.new(
      name: "Product Test",
      price_cents: 19.99,
      quantity: nil,
      category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end
    
    it "should not be valid unless there is a category set" do
      @category = Category.new(name: "Category Test")
      @product = Product.new(
        name: "Test Product",
        price: 19.99,
        quantity: 6,
        category: nil
        )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include ("Category can't be blank")
      end
  end
end