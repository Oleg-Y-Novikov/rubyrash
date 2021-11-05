class Book < Product
  class << self
    def books
      @books ||= []
    end

    def from_file(route)
      book = File.readlines(route).map!(&:chomp)
      new(title: book[0], genre: book[1], author: book[2], price: book[3].to_i, amount: book[4].to_i)
    end

    protected

    attr_writer :books

    def counter
      self.books += 1
    end
  end

  attr_accessor :genre, :author

  def initialize(params)
    super(params)
    @genre = params[:genre]
    @author = params[:author]
    Product.add(self)
    self.class.books << self
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{price} руб. (осталось #{amount})"
  end

  def update(params)
    super
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
