class Product < ApplicationRecord

  validates :type, :name, :inward_date, presence: true
end
