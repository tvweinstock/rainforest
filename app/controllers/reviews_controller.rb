class ReviewsController < ApplicationController
  before_filter :load_product, except: [:destroy]
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      respond_to do |format|
        format.html do
        redirect_to @product, notice: "Review created successfully"
        end
          format.js
      end
    else
      render 'products/show'
    end
  end

  def destroy
    puts "*********** IM destroying *************"
    @review = Review.find(params[:id])
    @product = @review.product
    if @review.destroy
      respond_to do |format|
        format.html do
          redirect_to @review.product, notice: "Review Deleted!"
        end
        format.js
      end
    else
      render 'products/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
