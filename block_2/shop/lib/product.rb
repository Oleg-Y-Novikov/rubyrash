class Product

  @@products = []

  def self.products
    @@products
  end

  attr_reader :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @title = params[:title]
  end

end
