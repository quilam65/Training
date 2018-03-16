class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all.published
  end
  def show
    @product = Product.find(params[:id])
  end
end
