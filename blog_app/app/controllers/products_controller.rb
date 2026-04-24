class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :require_admin!, only: %i[new create edit update destroy]
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
    @products = @products.where("name LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q].present?
    @products = @products.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Tạo sản phẩm thành công."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Cập nhật sản phẩm thành công."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Xóa sản phẩm thành công."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :category_id, :image)
  end
end
