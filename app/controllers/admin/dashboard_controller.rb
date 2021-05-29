class Admin::DashboardController < ApplicationController
  before_filter :authorize


  def show
    @products_count = Product.all.count
    @categories_count = Category.group(:name).count
    @total_category = @categories_count.values.sum
  end


end
