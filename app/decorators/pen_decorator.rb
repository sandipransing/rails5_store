class PenDecorator < ProductDecorator
  delegate_all

  def f_color
    color.titleize
  end

end
