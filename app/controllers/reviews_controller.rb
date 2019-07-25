# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = @restaurant.reviews.build(review_params)
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      flash[:notice] = 'Review added successfully!'
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = @review.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.fetch(:review, {}).permit(:rating, :body, :restaurant_id, :timestamp)
  end
end
