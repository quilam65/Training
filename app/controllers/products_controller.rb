class ProductsController < ApplicationController
  before_action :get_product, only: [:edit, :show, :update, :destroy]
  before_action :product_params, only: [:update, :create]

  def index
    @products = Product.includes(:category).all.published.references(:category)
  end

  def show
  end

  def edit
    render :new
  end

  def update
    return redirect_to products_path, notice: 'You have successfully updated the product' if @product.update!(@product_params)
    flash[:alert] = 'Updated errors'
    render :new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(@product_params)
    return redirect_to products_path, notice: 'You have successfully created the product' if @product.save
    flash[:alert] = 'There is an error in your form'
    render :new
  end

  def destroy

    return redirect_to products_path, notice: 'Delete successfully' if @product.destroy
    redirect_to products_path, alert: 'Delete error'
  end

  private
    def product_params
      @product_params=params.require(:product).permit(:title, :description,
                                                      :price,:published,
                                                      :country, :level, :category_id)
    end

    def get_product
      @product = Product.find(params[:id])
    end

end
