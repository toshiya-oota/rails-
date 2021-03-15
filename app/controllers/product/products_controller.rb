class Product::ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(:distinct => true).page(params[:page] || 1)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.product_details.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :controller => "product/products", :action => "show", :id => @product.id
    else
      flash[:alert] = "商品の登録に失敗しました。"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to :controller => "product/products", :action => "show", :id => @product.id
    else
      flash[:alert] = "商品の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to :controller => "product/products", :action => "index"
    else
      render :show
    end
  end

  def download
    @product = Product.find(params[:id])
    image = @product.image
    send_data(image.read, :filename => "download#{File.extname(image.path)}")
  end

  private def product_params
    product_detail_params = %i(
      id
      product_id
      color
      size
      season
      product_country
      scheduled_arrive
      colors
      _destroy
    )
    permitted_params = [
      :product_div,
      :item_cd,
      :product_cd,
      :name,
      :category,
      :sex,
      :status,
      :color,
      :sale_start,
      :sale_end,
      :image,
      { :product_details_attributes => product_detail_params },
    ]
    params.require(:product).permit(permitted_params)
  end
end
