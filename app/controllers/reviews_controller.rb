class ReviewsController < ApplicationController
  before_action :authenticate_user!

    def new
      @review.Review.new
    end

    def create
      @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to @review.restaurant
      else
        flash[:danger] = "You already added a review to this eatery!"
        redirect_to @review.restaurant
      end
    end

    private

      def review_params
        params.require(:review).permit(
          :comment_title, 
          :comment,
          :rating,
          :restaurant_id)
      end
  end
