class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :require_admin!, only: %i[new create edit update destroy]
  before_action :set_category, only: %i[edit update destroy]

  def index
    @categories = Category.all
    @categories = @categories.where("name LIKE ?", "%#{params[:q]}%") if params[:q].present?
    @categories = @categories.page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Tạo danh mục thành công."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Cập nhật danh mục thành công."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Xóa danh mục thành công."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
