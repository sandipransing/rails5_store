class Product < ApplicationRecord

  TYPE_PEN = 'Pen'
  TYPE_NOTEBOOK = 'Notebook'
  Types = [TYPE_PEN, TYPE_NOTEBOOK]

  validates :type, inclusion: { in: Types }, presence: true
  validates :name, :inward_date, presence: true
end
