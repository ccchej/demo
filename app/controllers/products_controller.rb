class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :edit, :update]

  def index
    query = params[:query].nil? ? nil : params[:query].split(',')
    if query.nil?
      @products = Product.all
    else
      @products = Product.joins(:categories).where(categories: { name: query }) + Product.joins(:references).where(references: { name: query })
    end

    if request.xhr?
      respond_to do |format|
        format.html { render :partial => "data_table", :layout => false  } 
      end
    end
  end

  def show
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update!(product_params)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    else
      render :show
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, { category_ids: [] }, :category_ids, { reference_ids: [] }, :reference_ids)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end
