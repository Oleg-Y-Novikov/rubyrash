class Product

  def self.products
    @products
  end

  def self.add(obj)
    @products ||= []
    products << obj
  end

  def self.from_file(route)
    raise NotImplementedError
  end

  attr_accessor :price, :amount, :title

  def initialize(params)
    @price = params[:price] || "Unknown"
    @amount = params[:amount] || "Unknown"
    @title = params[:title] || "Unknown"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
    @title = params[:title] if params[:title]
  end

  def to_s
    "Наименование: #{title}, цена #{price} руб, (осталось #{amount})"
  end
end
