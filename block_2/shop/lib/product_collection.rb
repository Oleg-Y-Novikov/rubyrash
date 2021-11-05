# frozen_string_literal: true

class ProductCollection
  PRODUCT_TYPES = {
    book: { dir: '/books', class: Book },
    movie: { dir: '/movie', class: Movie }
  }.freeze

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each_value do |hash|
      product_dir = hash[:dir]
      product_class = hash[:class]
      Dir["#{dir_path}#{product_dir}/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end
    new(products)
  end

  attr_reader :products

  def initialize(products = [])
    @products = products
  end

  # collection.sort!(by: :price, order: :asc)
  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by!(&:to_s)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount)
    end
    # Если запросили сортировку от большего к меньшему
    @products.reverse! if params[:order] == :asc
  end
end
