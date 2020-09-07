require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject(:cart) { FactoryBot.create(:cart) }
  let(:food_item1) { FactoryBot.create(:food_item) }
  let(:food_item2) { FactoryBot.create(:food_item) }
  let(:cart_item) { FactoryBot.create(:cart_item, cart_id: cart.id, food_item_id: food_item1.id) }

  # association
  describe 'has_many :cart_items' do
    it { is_expected.to have_many :cart_items }
  end

  describe 'has_one :order' do
    it { is_expected.to have_one :order }
  end

  describe 'belongs_to :user' do
    it { is_expected.to belong_to :user }
  end

  # instance_method
  describe '#total' do
    it 'should return cart total' do
      expect(cart_item.subtotal).to eq(cart.total)
    end
  end

  describe '#placed_cart' do
    it 'cart is placed' do
      cart.placed_cart
      expect(cart.final).to eq(true)
    end
  end

  describe '#require_same_restaurant' do
    let(:cart_item2) { FactoryBot.create(:cart_item, cart_id: cart.id, food_item_id: food_item2.id) }

    it 'restaurant different for new cart items' do
      expect(CartItem.count).to eq(false)
    end
  end
end
