class Brand < ApplicationRecord
    acts_as_followable
    has_many :products, dependent: :destroy
end
