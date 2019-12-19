class CategoriesController < ApplicationController
  def index
    # @categories = Category.order(:title)
    # code below simplifies displaying quantity of products on the index page passing .products_count method like so: <%= category.title %>(<%= category.products_count %> products)
    @categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
  end
end
