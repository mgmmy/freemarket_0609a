require 'rails_helper'

describe Product do
  describe '#create' do

    it "is invalid without a name" do 
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a detail" do 
      product = build(:product, detail: nil)
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end

    it "is invalid without a user_id" do 
      product = build(:product, user_id: nil)
      product.valid?
      expect(product.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do 
      product = build(:product, prefecture_id: nil)
      product.valid?
      expect(product.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a category_id" do 
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a charge_id" do 
      product = build(:product, charge_id: nil)
      product.valid?
      expect(product.errors[:charge_id]).to include("can't be blank")
    end

    it "is invalid without a condition_id" do 
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_method_id" do 
      product = build(:product, delivery_method_id: nil)
      product.valid?
      expect(product.errors[:delivery_method_id]).to include("can't be blank")
    end

    it "is invalid without a shipment_id" do 
      product = build(:product, shipment_id: nil)
      product.valid?
      expect(product.errors[:shipment_id]).to include("can't be blank")
    end

    it "is invalid without a price" do 
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid not integer" do 
      product = build(:product, price: "aaaa")
      product.valid?
      expect(product.errors[:price]).to include("type error")
    end
  
    it "is invalid too large" do 
      product = build(:product, price: 1000000000000)
      product.valid?
      expect(product.errors[:price]).to include("is too high")
    end

    it "is invalid too small" do 
      product = build(:product, price: 10)
      product.valid?
      expect(product.errors[:price]).to include("is too low")
    end
  end
end
