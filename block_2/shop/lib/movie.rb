class Movie < Product

  class << self
    def movies
      @movies ||= 0
    end

  protected
    attr_writer :movies

    def counter
      self.movies += 1
    end
  end

  def initialize(params)
    super(params)
    @year = params[:year]
    @director = params[:director]
    self.class.send :counter
    @@products << self
  end

  def to_s
    "Фильм #{@title}, #{@year}, реж. #{@director}, #{price}. (осталось #{amount})"
  end

  def each_movies
    self.class.movies.times { |movie| yield movie } if block_given?
  end
end
