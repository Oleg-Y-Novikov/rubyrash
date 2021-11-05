class Movie < Product
  class << self
    def movies
      @movies ||= []
    end

    def from_file(route)
      movie = File.readlines(route).map!(&:chomp)
      new(title: movie[0], year: movie[1].to_i, director: movie[2], price: movie[3].to_i, amount: movie[4].to_i)
    end

    protected

    attr_writer :movies

    def counter
      self.movies += 1
    end
  end

  attr_accessor :year, :director

  def initialize(params)
    super(params)
    @year = params[:year]
    @director = params[:director]
    Product.add(self)
    self.class.movies << self
  end

  def to_s
    "Фильм #{@title}, #{@year}, реж. #{@director}, #{price}. (осталось #{amount})"
  end

  def update(params)
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def each_movies
    self.class.movies.times { |movie| yield movie } if block_given?
  end
end
