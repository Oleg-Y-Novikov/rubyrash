class Book < Product

  class << self
    def books
      @books ||= 0
    end

  protected
    attr_writer :books

    def counter
      self.books += 1
    end
  end

  def initialize(params)
    super(params)
    @genre = params[:genre]
    @author = params[:author]
    self.class.send :counter
    @@products << self
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{price} руб. (осталось #{amount})"
  end

end
