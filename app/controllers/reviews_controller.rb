class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])

    if !current_user
      redirect_to product_path(@product)
    end

    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.user = current_user
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end


# future reference
#  def create
#    values = params[:review]
#    review = Review.new do |d|
#      d.user = current_user
#      d.product_id = params[:product_id]
#      d.description = values[:description]
#      d.rating = values[:rating]
#    end

#    if review.save
#      redirect_to "/products/#{params[:product_id]}", notice: 'New review created'
#    else
#      # @product = Product.find(params[:product_id])
#      # @review = Review.new
#      redirect_to "/products/#{params[:product_id]}",error: review.errors.full_messages.first
#    end
#  end

#  def destroy
#    @reviewd = Review.find params[:id]
#    @reviewd.destroy
#    redirect_to "/products/#{params[:product_id]}", notice: 'Review deleted'
#  end
# end