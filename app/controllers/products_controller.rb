class ProductsController < ApplicationController

  def new
    @product = Product.new(type: params[:type])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def index
    @products = Product.all
  end

  private

    def product_params
      params.require(:product).permit(:type, :name, :color, :status, :inward_date, :description)
    end
end
