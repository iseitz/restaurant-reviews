# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def assign
    if params[category_ids: []].present?
      @all_ids = params[category_ids: []]
      @new_categories = []
      @all_ids.each do |id|
        @category = Category.find(id)
        @new_categories << @category unless @restaurant.categories.include?(@category)
      end
    end
    @new_categories
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        if params['restaurant']['category_ids'][1] != ''
          params['restaurant']['category_ids'].each do |category_id|
            if (category_id.to_i <= Category.all.last.id) && (category_id.to_i > 0)
              RestaurantCategorization.create(restaurant_id: @restaurant.id, category_id: category_id.to_i)
            end
          end
        end
        @categories = @restaurant.categories

        format.html { redirect_to restaurant_path(@restaurant), notice: 'Restaurant added successfully' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, alert: 'Something went wrong please try again' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @reviews = @restaurant.reviews
    @categories = @restaurant.categories
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :address, :city, :state, :zip, :description, :category_ids)
  end
end
