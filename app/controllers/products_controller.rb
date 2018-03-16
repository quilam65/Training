class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all.published
  end

  def edit
    @product = Product.find(params[:id])
    render :new
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Delete successfully'
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])
    product_params=params.require(:product).permit(:title, :description, :price,:published, :country, :level, :category_id)

    if @product.update!(product_params)
      flash[:notice] = 'You have successfully updated the product'
      redirect_to products_path
    else
      flash[:alert] = 'There is an error in your form'
      render :new
    end
  end

  def new
    @product = Product.new
  end
  def create
    product_params=params.require(:product).permit(:title, :description, :price,:published, :country, :level, :category_id)
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'You have successfully created the product'
      redirect_to products_path
    else
      flash[:alert] = 'There is an error in your form'
      render :new
    end
  end
  def show
    @product = Product.find(params[:id])
  end

end
