# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @restaurants = @category.restaurants
  end

  def create; end

  private

  def category_params
    params.require(:category).permit(:id, :name)
  end
end
