require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do
  describe 'Validations' do
  # validates :name, presence: true
  it 'returns true if property :name is present in Product table' do
    product = Product.new
    expect(product.name).to be(nil)
  end

  # validates :price, presence: true
  it 'returns true if property :price is present in Product table' do
    product = Product.new(price: 100)
    expect(product.price).to eq(100)
  end

  # validates :quantity, presence: true
  it 'returns true if property :quantity is present in Product table' do
    product = Product.new(quantity: 10)
    expect(product.quantity).to eq(10)
  end

  # validates :category, presence: true
  it 'returns true if property :name is present in Product table' do
    product = Product.new(category_id: 1)
    expect(product.category_id).to be(1)
  end
  end
end