class ProductDecorator < ApplicationDecorator
  delegate_all

  include ActionView::Helpers

  def f_color
    '-'
  end

  def f_inward_date
    inward_date.strftime('%d/%m/%Y')
  end

  def f_price
    number_to_currency(price, precision: 2)
  end

  def f_status
    status ? 'Enabled' : 'Disabled'
  end
end
