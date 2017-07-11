class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all.map(&:decorate)
  end

  def new
    @product = Product.new(type: params[:type])
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save

      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:type, :name, :price, :color, :status, :inward_date, :description)
    end
end